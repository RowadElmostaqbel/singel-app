import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/checkout/data/models/send_checkout_data_model.dart';
import 'package:single_resturant_app/features/checkout/data/repo/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final ApiService _apiService;

  CheckoutRepoImpl({required ApiService apiService}) : _apiService = apiService;
  @override
  Future<Either<Failure, bool>> checkout(
      SendCheckoutDataModel checkoutDataModel) async {
    try {
      final res = await _apiService.post(
        endpoint: 'client/cart/checkout',
        data: checkoutDataModel.toJson(),
      );
      return Right(res['status']);
    } on DioException catch (exception) {
      return Left(
        ServerFailure.fromDioException(
          exception,
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
