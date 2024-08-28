class AddressModel {
  late int id;
  String? name;
  String? cityName;
  String? phone;
  String? additionalPhone;
  int? cityId;
  int? clientId;
  String? details;
  String? latitude;
  String? longitude;

  AddressModel({
    this.name,
    this.phone,
    this.cityName,
    this.additionalPhone,
    this.cityId,
    this.clientId,
    this.details,
    this.latitude,
    this.longitude,
  });

  AddressModel copyWith({
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
    return AddressModel(
      name: name ?? this.name,
      cityName: cityName ?? this.cityName,
      phone: phone ?? this.phone,
      additionalPhone: additionalPhone ?? this.additionalPhone,
      cityId: cityId ?? this.cityId,
      clientId: clientId ?? this.clientId,
      details: details ?? this.details,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityName = json['city'];
    phone = json['phone'];
    additionalPhone = json['additional_phone'];
    cityId = json['city_id'];
    clientId = json['client_id'];
    details = json['details'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  toJson() {
    return {
      "name": name,
      "phone": phone,
      "additional_phone": phone,
      "city_id": cityId,
      "client_id": clientId,
      "details": details,
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}
