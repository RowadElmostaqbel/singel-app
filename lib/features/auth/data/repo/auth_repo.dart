import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/auth/data/models/register_data_model.dart';

import '../../../../core/errors/failure.dart';
import '../models/user_model.dart';

class AuthRepo {
  final ApiService apiService;

  AuthRepo(this.apiService);

  Future<Either<Failure, bool>> register(
    RegisterDataModel registerData,
    File image,
  ) async {
    try {
      final data = await apiService.postFormData(
        endpoint: 'client/auth/register',
        data: registerData.toJson(),
        image: image,
      );
      return Right(
        data['status'],
      );
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
