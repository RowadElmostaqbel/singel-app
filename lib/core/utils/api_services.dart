import 'dart:io';

import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/features/auth/data/models/user_model.dart';
import 'package:single_resturant_app/features/my_address/data/models/addresses.dart';

class ApiService {
  final CacheServiceHeper cacheServiceHeper;
  final _baseUrl = 'https://deliback.rowaduae.com/api/';
  late Dio dio;
  late String token = '';
  CancelToken cancelToken = CancelToken();
  AddressModel addressModel = AddressModel();

  ApiService(this.cacheServiceHeper) {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: {
          "CLIENT-TYPE": 'web',
          "Accept": "application/json",
          'restaurant_id': '50',
        },
      ),
    );
  }

  Future<dynamic> get({
    required String endpoint,
  }) async {
    token = cacheServiceHeper
            .getData<UserModel>(key: 'user', boxName: 'user')
            ?.data
            ?.token ??
        '';
    dio.options.headers.addAll(
      {
        'Authorization': 'Bearer $token',
        // 'lang': LANG,
      },
    );

    var response = await dio.get(endpoint);
    return response.data;
  }

  Future<dynamic> delete({
    required String endpoint,
    // required Map<String, dynamic> data,
  }) async {
    try {
      token = cacheServiceHeper
              .getData<UserModel>(key: 'user', boxName: 'user')
              ?.data
              ?.token ??
          '';

      dio.options.headers.addAll(
        {
          'Authorization': 'Bearer $token',
          // 'lang': LANG,
        },
      );
      final response = await dio.delete(endpoint);
      print('Delete successful: ${response.statusCode}');
    } catch (e) {
      if (e is DioException) {
        print('Dio error: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        print('Unknown error: $e');
      }
    }
  }

  Future<dynamic> post(
      {required String endpoint, required Map<String, dynamic> data}) async {
    token = cacheServiceHeper
            .getData<UserModel>(key: 'user', boxName: 'user')
            ?.data
            ?.token ??
        '';

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

  Future<dynamic> patch(
      {required String endpoint, required Map<String, dynamic> data}) async {
    token = cacheServiceHeper
            .getData<UserModel>(key: 'user', boxName: 'user')
            ?.data
            ?.token ??
        '';

    dio.options.headers.addAll(
      {
        'Authorization': 'Bearer $token',
        // 'lang': LANG,
      },
    );
    var response = await dio.patch(
      endpoint,
      queryParameters: data,
    );
    return response.data;
  }

  Future<dynamic> postFormData({
    required String endpoint,
    required Map<String, dynamic> data,
    File? image,
  }) async {
    token = cacheServiceHeper
            .getData<UserModel>(key: 'user', boxName: 'user')
            ?.data
            ?.token ??
        '';

    FormData formData = FormData.fromMap(data);

    if (image != null) {
      String fileName = image.path.split('/').last;
      formData.files.add(
        MapEntry(
          'image',
          // This key should match the key expected by the server for the image
          await MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
        ),
      );
    }

    dio.options.headers.addAll(
      {
        'Authorization': 'Bearer $token',
      },
    );
    var response = await dio.post(
      endpoint,
      data: formData,
    );
    return response.data;
  }
}
