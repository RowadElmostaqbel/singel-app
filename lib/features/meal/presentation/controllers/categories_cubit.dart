import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/features/meal/data/repos/categories_repo.dart';

import '../../data/models/category_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  int selectedMainCategoryId = 0;

  List<CategoryModel> mainCategories = [];
  Map<String, List<CategoryModel>> subCategories = {};
  final CategoriesRepo categoriesRepo;
  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitial());

  Future<void> fetchMainCategories() async {
    emit(CategoriesLoadingState());
    final result = await categoriesRepo.fetchMainCategories();
    result.fold(
      (failure) => emit(
        CategoriesFailureState(
          failure,
        ),
      ),
      (categories) {
        mainCategories = categories;
        emit(
          CategoriesLoadedState(
            categories,
          ),
        );
      },
    );
  }

  changeSelectedMainCategoryId(int index) {
    selectedMainCategoryId = index;
    emit(
      SelectedMainCategoriesIdChangedState(
        index,
      ),
    );
  }

  Future<void> fetcSubCategories(String categoryId) async {
    emit(SubCategoriesLoadingState());
    final result = await categoriesRepo.fetchSubCategories(categoryId);
    result.fold(
      (failure) => emit(
        SubCategoriesFailureState(
          failure,
        ),
      ),
      (categories) {
        emit(
          SubCategoriesLoadedState(
            categories,
          ),
        );
        subCategories[categoryId] = categories;
      },
    );
  }
}
