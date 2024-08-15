import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/auth/data/models/client.dart';
import 'package:single_resturant_app/features/profile/data/repo/edit_profile_repo.dart';

class EditProfileRepoImpl extends EditProfileRepo {
  final ApiService _apiService;

  EditProfileRepoImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Either<Failure, Client>> updateProfile(
      {required Map<String, dynamic> data}) async {
    try {
      final res = await _apiService.postFormData(
        endpoint: 'client/profile/update',
        data: data,
        image: data['image'],
      );

      return Right(
        Client.fromJson(
          res['data'],
        ),
      );
    } on DioException catch (exception) {
      return Left(
        ServerFailure.fromDioException(exception),
      );
    } catch (exception) {
      return Left(
        ServerFailure(
          exception.toString(),
        ),
      );
    }
  }
}
