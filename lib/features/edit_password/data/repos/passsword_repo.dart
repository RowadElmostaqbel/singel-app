import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/edit_password/data/models/password_model.dart';

import '../../../../core/errors/failure.dart';

class PasswordRepo {
  final ApiService _apiService;

  PasswordRepo({required ApiService apiService}) : _apiService = apiService;

  Future updatePassword({required PasswordModel passwordModel}) async {
    try {
      final response = await _apiService.post(
          endpoint: "client/auth/changePassword", data: passwordModel.toJson());
      return Right(response['status']);
    } on DioException catch (e) {
      log(name: 'error', e.toString());
      return Left(
        ServerFailure.fromDioException(e),
      );
    } catch (e) {
      log(name: 'error', e.toString());

      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
