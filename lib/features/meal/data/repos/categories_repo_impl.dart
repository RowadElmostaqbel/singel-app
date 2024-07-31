import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';

import 'package:single_resturant_app/features/meal/data/models/category_model.dart';

import 'categories_repo.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final ApiService _apiService;

  CategoriesRepoImpl({required ApiService apiService})
      : _apiService = apiService;
  @override
  Future<Either<Failure, List<CategoryModel>>> fetchMainCategories() async {
    try {
      final res = await _apiService.get(endpoint: "client/mainCategories");
      return Right(
        res['data']
            .map<CategoryModel>((e) => CategoryModel.fromJson(e))
            .toList(),
      );
    } on DioException catch (exception) {
      return Left(
        ServerFailure.fromDioException(exception),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
  
  @override
  Future<Either<Failure, List<CategoryModel>>> fetchSubCategories(String categoryId) async{
    try {
      final res = await _apiService.get(endpoint: "client/subCategories/$categoryId");
      return Right(
        res['data']
            .map<CategoryModel>((e) => CategoryModel.fromJson(e))
            .toList(),
      );
    } on DioException catch (exception) {
      return Left(
        ServerFailure.fromDioException(exception),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<CategoryMealItem>>> fetchItemsBySubCategory(String categoryId) async{
      try {
      final res = await _apiService.get(endpoint: "client/itemsByCategory/$categoryId");
      return Right(
        res['data']
            .map<CategoryMealItem>((e) => CategoryMealItem.fromJson(e))
            .toList(),
      );
    } on DioException catch (exception) {
      return Left(
        ServerFailure.fromDioException(exception),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
