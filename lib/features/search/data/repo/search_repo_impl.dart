import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';
import 'package:single_resturant_app/features/search/data/repo/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService _apiService;

  SearchRepoImpl({required ApiService apiService}) : _apiService = apiService;

  @override
  Future<Either<Failure, List<CategoryMealItem>>> search(String query) async {
    try {
      final res = await _apiService.post(
        endpoint: 'client/item/search',
        data: {
          'name': query,
        },
      );

      return Right(
        res['data'].map<CategoryMealItem>(
          (e) => CategoryMealItem.fromJson(e),
        ).toList(),
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
