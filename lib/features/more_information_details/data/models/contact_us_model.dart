class ContactUsModel {
  String? name;
  String? phone;
  String? email;
  String? msg_type;
  String? msg;

  ContactUsModel({this.name, this.phone, this.email, this.msg_type, this.msg});

  ContactUsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    msg_type = json['msg_type'];
    msg = json['msg'];
  }

  toJson() {
    return {
      "name": name,
      "phone": phone,
      "email": email,
      "msg_type": msg_type,
      "msg": msg,
    };
  }
}
