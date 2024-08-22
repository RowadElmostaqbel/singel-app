import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/orders/data/models/cancel_reason_model.dart';
import 'package:single_resturant_app/features/orders/data/models/my_order_model.dart';
import 'package:single_resturant_app/features/orders/data/repo/order_repo.dart';

class OrderRepoImpl extends OrderRepo {
  final ApiService _apiService;

  OrderRepoImpl({required ApiService apiService}) : _apiService = apiService;
  @override
  Future<Either<Failure, List<MyOrderModel>>> fetchMyOrders() async {
    try {
      final res = await _apiService.get(endpoint: 'client/myOrderes');
      return Right(
        res['data'].map<MyOrderModel>((e) => MyOrderModel.fromJson(e)).toList(),
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

  @override
  Future<Either<Failure, bool>> cancelOrder(
      {required String orderId, required Map<String, dynamic> data}) async {
    try {
      final res = await _apiService.patch(
          endpoint: 'client/cancelOrder/$orderId', data: data);
      return Right(
        res['status'],
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

  @override
  Future<Either<Failure, List<CancelReasonModel>>>
      fetchCancelOrderReasons() async {
    try {
      final res = await _apiService.get(endpoint: 'client/cancelationReasons');
      return Right(
        res['data']
            .map<CancelReasonModel>((e) => CancelReasonModel.fromJson(e))
            .toList(),
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
