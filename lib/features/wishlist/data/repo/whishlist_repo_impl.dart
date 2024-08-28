import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';
import 'package:single_resturant_app/features/wishlist/data/repo/whishlist_repo.dart';

class WhishlistRepoImpl extends WhishlistRepo {
  final ApiService _apiService;

  WhishlistRepoImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Either<Failure, bool>> toggleFavorite(int itemId) async {
    try {
      final res = await _apiService.post(
        endpoint: 'client/item/favourite',
        data: {
          'item_id': itemId,
        },
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
  Future<Either<Failure, List<CategoryMealItem>>> fetchFavorites() async {
    try {
      final res = await _apiService.get(
        endpoint: 'client/item/favourite',
      );
      return Right(
        res['data']
            .map<CategoryMealItem>(
              (item) => CategoryMealItem.fromJson(item['item']),
            )
            .toList(),
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
