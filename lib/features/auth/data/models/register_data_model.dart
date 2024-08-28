class RegisterDataModel {
  String? name;
  String? phone;
  String? email;
  String? password;
  String? password_confirmation;
  String? image;
  String? countryCode;

  RegisterDataModel({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.password_confirmation,
    this.image,
    this.countryCode,
  });


  RegisterDataModel copyWith({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? password_confirmation,
    String? image,
    String? countryCode,
  }){
    return RegisterDataModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      password_confirmation: password_confirmation ?? this.password_confirmation,
      image: image ?? this.image,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone':countryCode! + phone!,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
      'restaurant_id': 50,
    };
  }
}
