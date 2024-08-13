import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:single_resturant_app/features/my_address/data/models/add_address_model.dart';
import 'package:single_resturant_app/features/my_address/data/repos/add_address_repo.dart';

import '../../data/models/get_address.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddAddressRepo addAddressRepo;
  late GetAddress getAddress;

  AddressCubit(this.addAddressRepo) : super(AddressInitial());

  AddAddressModel addAddressModel = AddAddressModel();

  addAddressName(String userName) {
    addAddressModel.addresses?[0].name = userName;
  }

  addAddressPhone(String phone) {
    addAddressModel.addresses?[0].phone = phone;
  }
}
