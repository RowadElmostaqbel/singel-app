import 'addresses.dart';

class AddAddressModel {
  List<Addresses>? addresses;

  AddAddressModel({this.addresses});

  AddAddressModel.fromJson(Map<String, dynamic> json) {
    addresses = json['addresses'];
  }

  toJson() {
    return {
      "addresses": addresses,
    };
  }
}
