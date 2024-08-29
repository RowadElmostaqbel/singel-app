import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/coupons/data/models/coupon_model.dart';
import 'package:single_resturant_app/features/coupons/data/repos/coupon_repo.dart';

class CouponRepoImpl extends CouponRepo {
  final ApiService _apiService;

  CouponRepoImpl({required ApiService apiService}) : _apiService = apiService;

  @override
  Future<Either<Failure, CouponModel>> applyCoupon(
      {required String code}) async {
    try {
      final res = await _apiService
          .post(endpoint: 'client/couponDetails', data: {'coupon': code});

      return Right(
        CouponModel.fromJson(
          res['data'],
        ),
      );
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
