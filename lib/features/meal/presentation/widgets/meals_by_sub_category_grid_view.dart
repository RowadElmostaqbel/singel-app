import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';
import 'package:single_resturant_app/features/meal/presentation/controllers/categories_cubit.dart';

import '../../../home/presentation/widgets/popular_meal_list_item.dart';

class MealsBySubCategoryGridView extends HookWidget {
  const MealsBySubCategoryGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int subCategoryId = context.watch<CategoriesCubit>().selectedSubCategoryId;
    List<CategoryMealItem> meals = context
            .watch<CategoriesCubit>()
            .mealsByCategory[subCategoryId.toString()] ??
        [];
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (meals.isNotEmpty) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 12,
              right: 12,
              left: 12,
              bottom: 60,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: context.height * 0.001,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) => PopularMealListItem(
              categoryMealItem: meals[index],
            ),
            itemCount: meals.length,
          );
        } else if (state is MealsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MealsLoadedState && meals.isEmpty) {
          return Image.asset(Assets.assetsImagesEmpty);
        }
        return const SizedBox();
      },
    );
  }
}
