class RegisterDataModel {
  String? name;
  String? phone;
  String? email;
  String? password;
  String? password_confirmation;
  String? image;


  RegisterDataModel(
      { this.name,
       this.phone,
       this.email,
       this.password,
       this.password_confirmation,
       this.image,});


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
      'restaurant_id':50,
    };
  }
}
