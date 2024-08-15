import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';
import 'package:single_resturant_app/features/meal/presentation/controllers/categories_cubit.dart';

part 'whishlist_state.dart';

class WhishlistCubit extends Cubit<WhishlistState> {
  final CategoriesCubit categoriesCubit;
  WhishlistCubit(this.categoriesCubit) : super(WhishlistInitial());

  toggleFavoriteLocally(int mealId) {
    List<List<CategoryMealItem>> allMeals =
        categoriesCubit.mealsByCategory.values.toList();

    for (var element in allMeals) {
      for (CategoryMealItem element in element) {
        if (element.id == mealId) {
          element.isFavorite = !element.isFavorite;
          emit(WhishlistChangedState(
            status: element.isFavorite,
            id: mealId,
          ));
          return;
        }
      }
    }
  }
}
