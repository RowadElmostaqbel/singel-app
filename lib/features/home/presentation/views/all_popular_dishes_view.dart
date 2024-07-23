import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/custom_app_bar.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/popular_meal_list_item.dart';

class AllPopularDishesView extends StatelessWidget {
  const AllPopularDishesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              const CustomAppBar(title: 'Popular Dishes'),
              const Gap(36),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: context.height * 0.00065,
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) => PopularMealListItem(
                    index: index,
                  ),
                  itemCount: 9,
                ),
              ),
              const Gap(36),
            ],
          ),
        ),
      ),
    );
  }
}
