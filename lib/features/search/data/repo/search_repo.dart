import 'package:dartz/dartz.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';

abstract class SearchRepo {
  Future<Either<Failure,List<CategoryMealItem>>>search(String query);
}