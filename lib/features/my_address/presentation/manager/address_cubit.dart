import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  String title = "";
  String phone = "";
  String address = "";

  add() {
    emit(AddAddressState());
  }

  remove() {
    emit(RemoveAddressState());
  }
}
