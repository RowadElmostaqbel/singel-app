class Addresses {
  String? name;
  String? phone;
  String? additional_phone;
  int? city_id;
  int? client_id;
  String? details;
  String? latitude;
  String? longitude;

  Addresses(
      {required this.name,
      required this.phone,
      required this.additional_phone,
      required this.city_id,
      required this.client_id,
      required this.details,
      required this.latitude,
      required this.longitude});

  Addresses.fromJson(Map<String, dynamic> json) {
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
      "additional_phone": additional_phone,
      "city_id": city_id,
      "client_id": 8,
      "details": details,
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}
