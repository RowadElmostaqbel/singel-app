class LoginDataModel {
  String? phone;
  String? password;
  String? countryCode;

  LoginDataModel({this.phone, this.password, this.countryCode});


  LoginDataModel copyWith({String? phone, String? password, String? countryCode}) {
    return LoginDataModel(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'phone':countryCode! + phone!,
      'password': password,
    };
  }
}
