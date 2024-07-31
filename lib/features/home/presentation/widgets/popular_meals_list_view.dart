import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/features/home/presentation/views/all_popular_meals_view.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/popular_meal_list_item.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';

class PopularMealsListView extends StatelessWidget {
  const PopularMealsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Popular Meals',
              style: TextStyles.black18SemiBold,
            ),
            GestureDetector(
              onTap: () => context.navigateTo(
                const AllPopularMealsView(),
              ),
              child: const Text(
                'Show all',
                style: TextStyles.primary14Regular,
              ),
            ),
          ],
        ),
        const Gap(16),
        SizedBox(
          height: 190,
          child: ListView.separated(
            padding: const EdgeInsets.only(
              top: 12,
              right: 12,
              bottom: 12,
              left: 4,
            ),
            itemBuilder: (context, index) => PopularMealListItem(
              categoryMealItem: CategoryMealItem(
                id: 1,
                subCategoryId: 1,
                restaurantId: 1,
                isActive: true,
                name: 'name',
                desc: 'desc',
                img: '',
              ),
            ),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const Gap(16),
            itemCount: 8,
          ),
        ),
      ],
    );
  }
}
