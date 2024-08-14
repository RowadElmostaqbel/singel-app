import 'package:single_resturant_app/core/utils/cache_service.dart';

class Addresses {
  int? id;
  String? name;
  String? phone;
  String? additional_phone;
  int? city_id;
  int? client_id;
  String? details;
  String? latitude;
  String? longitude;

  Addresses({
    this.name,
    this.phone,
    this.additional_phone,
    this.city_id,
    this.client_id,
    this.details,
    this.latitude,
    this.longitude,
  });

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    additional_phone = json['additional_phone'];
    city_id = json['city_id'];
    client_id = json['client_id'];
    details = json['details'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  toJson() {
    return {
      "name": name,
      "phone": phone,
      "additional_phone": phone,
      "city_id": city_id,
      "client_id": client_id,
      "details": details,
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}
