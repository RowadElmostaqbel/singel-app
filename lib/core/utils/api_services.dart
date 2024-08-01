import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://deliback.rowaduae.com/api/';
  late Dio dio;
   String token='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5Yzk5MGQ0Ny1iMGI5LTRmMGEtOGYyMy03MWVkMzYwZTI2MjIiLCJqdGkiOiIwOThmZGZmZmUxOGMyZmMxYWMwNWE5NzZmMGM3YmVkNjNhMjI2OGY4OTFhYzRlNzI2OWM1ZmVlMjVmM2QwODliZGZmYzEzNmVhMWUzN2NhOSIsImlhdCI6MTcyMjUxMDU0OS4zMjY3NjIsIm5iZiI6MTcyMjUxMDU0OS4zMjY3NjMsImV4cCI6MTcyMzM3NDU0OS4zMjM0OSwic3ViIjoiNyIsInNjb3BlcyI6WyJjbGllbnQiXX0.SBeq9ckW9JmFO9HfnVWbfi0UxUt49XrNszcGcTHtstJX6VSmLhVtxziwTBWAQ4ueiiHvIaAOakrVPEcW3JmYVBmIwMU3DPgqafDdHH7_h7FvI22-bVERwa2zArShWfIxQd7J5aLNeYCLylaym04RqQxdJtD62QHC5biQ4Zx7id2i9rZXKk_9nizQ9Qe89fuxzPTHnbetOJhfHTeRXK-QWayQ_GpFYP3LsmRWgvOAuVFM9HpYF9tmg0fKkJ4Vv9xvo8a-VZk2rV1vPONwvRWew1z0_7ShOy9d6BOLxTHgUOkuG6Rf4QFIuTWu-1YnTkbIr_0c7jgb6isvrU0kSda-KxDb238sT3og2HkUE-Rq-UvIfMQsDzUMDEWP-SbBHdq7XRob7PNGs-ubtBdOeYftWbohfyUBIfooWzHJlaIQQi8jqKCubR2NcL_A8ZZg-tajl7ZmjdpdCtgIfScljJWfgtJIyQSYX-xJfSJByVBDvZjjQHW_ke3yssNl9R1C-TTXwgv5PzAprjedzC-a6T72-MvLbapjW-X1gWSUeFu2PiTuhaFFovfdd1SU8mhfvtUPgExP452wSZOUPvtpBDSTII70ErqEf8YXME67-bZFKOFiNSfJfR3x9TwEJc7WbzM498B2Ai527zH7xeuptD0if5JstiCq-8TY2xfxsKriOPM';
  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: {
          "CLIENT-TYPE": 'web',
          "Accept": "application/json",
          'restaurant_id':'50',
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
