import 'addresses.dart';

class AddAddressModel {
  List<AddressModel> addresses = [];

  AddAddressModel({required this.addresses});

  AddAddressModel.fromJson(Map<String, dynamic> json) {
    addresses = json['addresses'];
  }

  toJson() {
    return {
      "addresses": addresses.map((e) => e.toJson()).toList(),
    };
  }
}
