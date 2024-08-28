import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/cart/data/models/add_to_cart_data_model.dart';
import 'package:single_resturant_app/features/cart/data/models/cart_model.dart';
import 'package:single_resturant_app/features/cart/data/repos/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final ApiService _apiService;

  CartRepoImpl({required ApiService apiService}) : _apiService = apiService;
  @override
  Future<Either<Failure, bool>> addItemToCart(
      AddToCartDataModel addToCartDataModel) async {
    try {
      final res = await _apiService.post(
        endpoint: 'client/cart',
        data: addToCartDataModel.toJson(),
      );

      return Right(res['status'] ?? false);
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

  @override
  Future<Either<Failure, List<CartModel>>> getCart() async {
    try {
      final res = await _apiService.get(endpoint: 'client/myCart');

      return Right(
        res['data'].map<CartModel>((e) => CartModel.fromJson(e)).toList(),
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
