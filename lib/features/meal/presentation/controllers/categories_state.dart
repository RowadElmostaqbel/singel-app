part of 'categories_cubit.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class SelectedMainCategoriesIdChangedState extends CategoriesState {
  final int index;

  const SelectedMainCategoriesIdChangedState(this.index);
}

final class CategoriesLoadingState extends CategoriesState {}

final class CategoriesLoadedState extends CategoriesState {
  final List<CategoryModel> categories;

  const CategoriesLoadedState(this.categories);
}

final class CategoriesFailureState extends CategoriesState {
  final Failure failure;

  const CategoriesFailureState(this.failure);
}

final class SubCategoriesLoadingState extends CategoriesState {}

final class SubCategoriesLoadedState extends CategoriesState {
  final List<CategoryModel> subCategories;

  const SubCategoriesLoadedState(this.subCategories);
}

final class SubCategoriesFailureState extends CategoriesState {
  final Failure failure;

  const SubCategoriesFailureState(this.failure);
}
