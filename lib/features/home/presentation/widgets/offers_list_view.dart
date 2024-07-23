import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/offer_list_item.dart';

import '../../../../core/utils/text_styles.dart';
import '../views/all_offers_view.dart';

class OffersListVIew extends StatelessWidget {
  const OffersListVIew({
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
              'Offers',
              style: TextStyles.black18SemiBold,
            ),
            GestureDetector(
              onTap: () => context.navigateTo(
                const AllOffersView(),
              ),
              child: const Text(
                'Show all',
                style: TextStyles.primary14Regular,
              ),
            ),
          ],
        ),
        const Gap(24),
        SizedBox(
          height: 325,
          child: ListView.separated(
            padding: const EdgeInsets.only(
              top: 12,
              right: 12,
              bottom: 12,
              left: 4,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const OfferListITem(),
            separatorBuilder: (context, index) => const Gap(16),
            itemCount: 8,
          ),
        ),
      ],
    );
  }
}
