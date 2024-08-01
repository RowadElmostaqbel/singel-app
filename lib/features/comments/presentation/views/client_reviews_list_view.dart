import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../../../../core/utils/text_styles.dart';

class ClientReviewsListView extends StatelessWidget {
  const ClientReviewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          Assets.assetsImagesProfile,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Gap(8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Omar Ali',
                            style: TextStyles.black16SemiBold,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: Image.asset(Assets.assetsIconsStar),
                              ),
                              const Text('4.7'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text('10-8-2024', style: TextStyles.darkGrey14SemiBold),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: context.width,
              height: 1,
              color: AppColors.greyColor.withOpacity(.6),
            ),
            const Text(
              '''This restaurant is the better for meals and offers and good services...''',
              style: TextStyles.darkGrey14SemiBold,
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => const Gap(16),
      itemCount: 8,
    );
  }
}
