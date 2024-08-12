import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/auth/data/models/register_data_model.dart';

import '../../../../core/errors/failure.dart';
import '../models/user_model.dart';

class AuthRepo {
  final ApiService apiService;

  AuthRepo(this.apiService);



    Future<Either<Failure, UserModel>> register(
      RegisterDataModel registerData) async {
    try {
      final data =await apiService.postFormData(
      endpoint: 'client/auth/register',
      data: registerData.toJson(),
    );
      return Right(
        UserModel.fromJson(data),
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioException(e),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
