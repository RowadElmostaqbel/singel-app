import 'package:hive_flutter/hive_flutter.dart';
import 'client.dart';
part 'data.g.dart';

@HiveType(typeId: 2)
class Data {
  @HiveField(0)
  Client? client;
  @HiveField(1)
  String? token;

  Data({required this.client, required this.token});

  Data.fromJson(Map<String, dynamic> json) {
    client = Client.fromJson(json['client']);
    token = json['token'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['client'] = client?.toJson();
    json['token'] = token;
    return json;
  }
}
