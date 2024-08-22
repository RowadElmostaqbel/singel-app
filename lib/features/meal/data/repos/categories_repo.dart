import 'package:dartz/dartz.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';
import 'package:single_resturant_app/features/meal/data/models/category_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<CategoryModel>>> fetchMainCategories();
  Future<Either<Failure, List<CategoryModel>>> fetchSubCategories(final String categoryId);
  Future<Either<Failure, List<CategoryMealItem>>> fetchItemsBySubCategory(final String categoryId);
}
