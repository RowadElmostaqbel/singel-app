class PasswordModel {
  String? current_password;
  String? new_password;
  String? new_password_confirmation;

  PasswordModel(
      {this.current_password,
      this.new_password,
      this.new_password_confirmation});

  PasswordModel.fromJson(Map<String, dynamic> json) {
    current_password = json['current_password'];
    new_password = json['new_password'];
    new_password_confirmation = json['new_password_confirmation'];
  }

  toJson() {
    return {
      "current_password": current_password,
      "new_password": new_password,
      "new_password_confirmation": new_password_confirmation,
    };
  }
}
