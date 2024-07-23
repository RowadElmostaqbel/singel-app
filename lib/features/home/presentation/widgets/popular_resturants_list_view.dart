

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/features/home/presentation/views/all_popular_resturants_view.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/popular_resturant_list_item.dart';

class PopularResturantsListView extends StatelessWidget {
  const PopularResturantsListView({
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
              'Popular Resturants',
              style: TextStyles.black18SemiBold,
            ),
            GestureDetector(
              onTap: () => context.navigateTo(
                const AllPopularResturantsView(),
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
          height: 260,
          child: ListView.separated(
             padding: const EdgeInsets.only(
              top: 12,
              right: 12,
              bottom: 12,
              left: 4,
            ),
            itemBuilder: (context, index) => const PopularResturantListItem(),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const Gap(16),
            itemCount: 8,
          ),
        ),
      ],
    );
  }
}
