import 'client.dart';

class Data{
  Client? client;
  String? token;

  Data({required this.client, required this.token});

  Data.fromJson(Map<String , dynamic> json){
    client = Client.fromJson(json['client']);
    token = json['token'];
  }
  Map<String , dynamic> toJson(){
    Map<String , dynamic> json = {};
    json['client']=client?.toJson();
    json['token']=token;
    return json;
  }
}