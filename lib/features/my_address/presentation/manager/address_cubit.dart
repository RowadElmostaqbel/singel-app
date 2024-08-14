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
  List<Addresses> addresses = [];
  late GetAddress getAddress;

  AddressCubit(this.addressRepo) : super(AddressInitial());

  AddAddressModel addAddressModel = AddAddressModel(
    addresses: [
      Addresses(),
    ],
  );

  addAddressName(String userName) {
    addAddressModel.addresses[0].name = userName;
  }

  addAddressPhone(String phone) {
    addAddressModel.addresses[0].phone = phone;
  }

  addAddressCity() {
    addAddressModel.addresses[0].city_id = 1;
  }

  addAddresDetails(String details) {
    addAddressModel.addresses[0].details = details;
  }

  addAddresLatlng(LatLng latLng) {
    addAddressModel.addresses[0].latitude = latLng.latitude.toString();
    addAddressModel.addresses[0].longitude = latLng.longitude.toString();
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
    addAddressModel.addresses[0].client_id = CacheServiceHeper()
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

  checkIfTheDataIsNotComplete() {
    log(addAddressModel.addresses[0].client_id.toString());
    return addAddressModel.addresses.first.city_id == null ||
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
