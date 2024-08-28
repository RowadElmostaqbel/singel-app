import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/features/auth/data/models/user_model.dart';
import 'package:single_resturant_app/features/my_address/data/models/add_address_model.dart';
import 'package:single_resturant_app/features/my_address/data/models/addresses.dart';
import 'package:single_resturant_app/features/my_address/data/repos/addressess_repo.dart';

import '../../data/models/get_address.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressRepo addressRepo;
  List<AddressModel> addresses = [];
  late GetAddress getAddress;

  AddressCubit(this.addressRepo) : super(AddressInitial());

  AddAddressModel addAddressModel = AddAddressModel(
    addresses: [
      AddressModel(),
    ],
  );

  addDataToModel({
    String? name,
    String? cityName,
    String? phone,
    String? additionalPhone,
    int? cityId,
    int? clientId,
    String? details,
    String? latitude,
    String? longitude,
  }) {
    addAddressModel.addresses[0] = addAddressModel.addresses[0].copyWith(
      name: name,
      cityName: cityName,
      phone: phone,
      additionalPhone: additionalPhone,
      cityId: cityId,
      clientId: clientId,
      details: details,
      latitude: latitude,
      longitude: longitude,
    );
  }

  addAddress() async {
    if (checkIfTheDataIsNotComplete()) {
      emit(
        SendAddressToServerFailureState(
          message: 'Please fill all the fields',
        ),
      );
      return;
    }
    addAddressModel.addresses[0].clientId = CacheServiceHeper()
        .getData<UserModel>(key: 'user', boxName: 'user')!
        .data!
        .client!
        .id;
    emit(SendAddressToServerLoadingState());

    final result = await addressRepo.addAddress(addAddressModel);

    result.fold(
      (failure) {
        emit(
          SendAddressToServerFailureState(
            message: failure.msg,
          ),
        );
      },
      (status) {
        emit(
          SendAddressToServerLoadedState(
            status: status,
          ),
        );
      },
    );
  }

  deleteAddress(int addressId) async {
    log(name: 'address Id', addressId.toString());
    emit(DeleteAddressLoadingState());
    final result = await addressRepo.deleteAddress(addressId);
    result.fold(
      (failure) {
        log(name: 'error', failure.msg.toString());
        emit(
          DeleteAddressFailureState(
            message: failure.msg,
          ),
        );
      },
      (status) {
        emit(
          DeleteAddressSuccessState(),
        );
      },
    );
  }

  checkIfTheDataIsNotComplete() {
    log(addAddressModel.addresses[0].clientId.toString());
    return addAddressModel.addresses.first.cityId == null ||
        addAddressModel.addresses.first.details == null ||
        addAddressModel.addresses.first.latitude == null ||
        addAddressModel.addresses.first.longitude == null ||
        addAddressModel.addresses.first.name == null ||
        addAddressModel.addresses.first.phone == null;
  }

  fetchMyAddresses() async {
    emit(FetchAddressLoadingState());
    final res = await addressRepo.fetchMyAddressess();

    res.fold(
        (error) => emit(
              FetchAddressFailureState(
                message: error.msg,
              ),
            ), (address) {
      addresses = address;
      emit(FetchAddressSuccessState());
    });
  }
}
