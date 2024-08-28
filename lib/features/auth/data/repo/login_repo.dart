import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/auth/data/models/login_data_model.dart';
import 'package:single_resturant_app/features/auth/data/models/user_model.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);

  Future<Either<Failure, UserModel>> login(
      LoginDataModel loginDataModel) async {
    try {
      final data = await apiService.post(
        endpoint: 'client/auth/login',
        data: loginDataModel.toJson(),
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
