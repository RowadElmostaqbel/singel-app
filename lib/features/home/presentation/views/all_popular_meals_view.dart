import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/custom_app_bar.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/popular_meal_list_item.dart';

import '../../../meal/data/models/category_meal_item.dart';

class AllPopularMealsView extends StatelessWidget {
  const AllPopularMealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Column(
            children: [
              const CustomAppBar(title: 'Popular Dishes'),
              const Gap(36),
              Expanded(
                child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: context.height * 0.00085,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => PopularMealListItem(
                     categoryMealItem: CategoryMealItem(
                id: 1,
                subCategoryId: 1,
                restaurantId: 1,
                isActive: true,
                name: 'name',
                desc: 'desc',
                isOrdered: false,
                img: '',
                isFavorite: false,
              ),
                  ),
                  itemCount: 9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
