

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/home/presentation/views/all_fast_delivery_view.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/fast_delivary_list_item.dart';

import '../../../../core/utils/text_styles.dart';

class FastDelivaryListView extends StatelessWidget {
  const FastDelivaryListView({
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
              'Fast Delivery',
              style: TextStyles.black18SemiBold,
            ),
            GestureDetector(
              onTap: () => context.navigateTo(const AllFastDeliveryView()),
              child: const Text(
                'Show all',
                style: TextStyles.primary14Regular,
              ),
            ),
          ],
        ),
        const Gap(24),
        SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.only(
              top: 12,
              right: 12,
              bottom: 12,
              left: 4,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const FastDelivaryListItem(
              fromShowAll: false,
            ),
            separatorBuilder: (context, index) => const Gap(16),
            itemCount: 8,
          ),
        ),
      ],
    );
  }
}
