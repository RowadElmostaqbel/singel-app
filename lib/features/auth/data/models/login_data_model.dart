class LoginDataModel {
  String? phone;
  String? password;

  LoginDataModel({ this.phone,  this.password});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
    };
  }
}
