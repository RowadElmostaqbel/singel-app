import 'package:hive_flutter/hive_flutter.dart';

import 'data.dart';
part 'user_model.g.dart';
@HiveType(typeId: 3)
class UserModel {
  @HiveField(0)
  Data? data;
  @HiveField(1)
  bool? status;
  @HiveField(2)
  String? message;
  @HiveField(3)
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
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['data'] = data?.toJson();
    json['status'] = status;
    json['message'] = message;
    json['error'] = error;
    return json;
  }
}
