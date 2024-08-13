class GetAddress {
  bool? status;
  String? message;
  String? error;

  GetAddress(
      {required this.status, required this.message, required this.error});

  GetAddress.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['status'] = status;
    json['message'] = message;
    json['error'] = error;
    return json;
  }
}
