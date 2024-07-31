
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/custom_app_bar.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/popular_resturant_list_item.dart';

class AllPopularResturantsView extends StatelessWidget {
  const AllPopularResturantsView({super.key});

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
              const CustomAppBar(title: 'Popular Resturants'),
              const Gap(36),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 20,
                    childAspectRatio: context.height * 0.0008,
                  ),
                  itemBuilder: (context, index) =>
                      const PopularResturantListItem(),
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
