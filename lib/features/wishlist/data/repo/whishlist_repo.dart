import 'package:dartz/dartz.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';

abstract class WhishlistRepo {
  Future<Either<Failure, bool>> toggleFavorite(int itemId);
  Future<Either<Failure, List<CategoryMealItem>>> fetchFavorites();
}
