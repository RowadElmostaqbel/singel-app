
import 'package:bloc/bloc.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';
import 'package:single_resturant_app/features/wishlist/data/repo/whishlist_repo.dart';

import '../../../../core/errors/failure.dart';

part 'whishlist_state.dart';

class WhishlistCubit extends Cubit<WhishlistState> {
  final WhishlistRepo _whishlistRepo;

  List<CategoryMealItem> myWishlist = [];

  WhishlistCubit(this._whishlistRepo) : super(WhishlistInitial());

  fetchMyWishlist() async {
    emit(FetchWishlistLoadingState());
    final res = await _whishlistRepo.fetchFavorites();
    res.fold(
        (failure) => emit(
              FetchWishlistFailureState(
                failure: failure,
              ),
            ), (meals) {
      myWishlist = meals;
      emit(
        FetchWishlistLoadedState(),
      );
    });
  }

  toggleFavorite(CategoryMealItem mealItem) async {
    toggleFavoriteLocally(mealItem);

    final res = await _whishlistRepo.toggleFavorite(mealItem.id!);

    res.fold((failure) {
      toggleFavoriteLocally(mealItem);
    }, (status) {});
  }

  toggleFavoriteLocally(CategoryMealItem mealItem) {
    mealItem.isFavorite = !mealItem.isFavorite;
    emit(
      WhishlistChangedState(
        status: mealItem.isFavorite,
        id: mealItem.id!,
      ),
    );
  }

  findDesiredMeal(int mealId) {
  
    for (var element in myWishlist) {
     
        if (element.id == mealId) {
          return element;
        }
      
    }
  }
}
