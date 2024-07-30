import 'data.dart';

class UserModel {
  Data? data;
  bool? status;
  String? message;
  String? error;

  UserModel(
      {required this.data,
      required this.status,
      required this.message,
      required this.error});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
    error = json['error'];
  }
  Map<String , dynamic>toJson(){
    Map<String , dynamic> json= {};
    json['data']= data?.toJson();
    json['status'] = status;
    json['message'] = message;
    json['error']= error;
    return json;
  }

}
