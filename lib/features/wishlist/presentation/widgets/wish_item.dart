import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/add_to_fav_btn.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';

class WishItem extends StatelessWidget {
  final int index;
  const WishItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .45,
      child: Stack(
        children: [
          Positioned(
            bottom: 5,
            right: 0,
            left: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                  height: constraints.maxHeight * .7,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Gap(14),
                        const Text(
                          'Spaghetti Chicken Cheese',
                          style: TextStyles.black14Regular,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColors.yellowColor,
                                    ),
                                    Text(
                                      '4.2',
                                      style: TextStyles.black14Medium,
                                    ),
                                  ],
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '65',
                                    style: TextStyles.black16Regular,
                                    children: [
                                      TextSpan(
                                        text: ' SAR',
                                        style: TextStyles.primary14Regular,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0,
                                right: 12,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(8),
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                    Assets.assetsIconsAddToCartIcon),
                              ),
                            ),
                          ],
                        ),
                        const Gap(12),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          Hero(
            tag: 'popularDishListItem$index',
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                Assets.assetsImagesDish,
                width: context.width * .225,
              ),
            ),
          ),
          const Positioned(
            top: 35,
            right: 0,
            child: AddToFavBtn(),
          )
        ],
      ),
    );
  }
}
