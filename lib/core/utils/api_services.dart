import 'dart:developer';
import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://deliback.rowaduae.com/api/';
  late Dio dio;
   String token='';
  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: {
          "CLIENT-TYPE": 'web',
          "Accept": "application/json",
          'restaurant_id':'24',
        },
      ),
    );
  }

  Future<dynamic> get({
    required String endpoint,
  }) async {
    dio.options.headers.addAll(
      {
        'Authorization': 'Bearer $token',
        // 'lang': LANG,
      },
    );

    var response = await dio.get(endpoint);
    return response.data;
  }

  Future<dynamic> post(
      {required String endpoint, required Map<String, dynamic> data}) async {
    dio.options.headers.addAll(
      {
        'Authorization': 'Bearer $token',
        // 'lang': LANG,
      },
    );
    var response = await dio.post(
      endpoint,
      queryParameters: data,
    );
    return response.data;
  }

  Future<dynamic> postFormData({required String endpoint, dynamic data}) async {
    dio.options.headers.addAll(
      {
        'Authorization': 'Bearer $token',
      },
    );
    var response = await dio.post(
      endpoint,
      data: data,
    );
    return response.data;
  }
}
