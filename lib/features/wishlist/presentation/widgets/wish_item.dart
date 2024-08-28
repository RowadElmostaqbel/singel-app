import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/add_to_fav_btn.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';

class WishItem extends StatelessWidget {
  final CategoryMealItem mealItem;
  const WishItem({
    super.key,
    required this.mealItem,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Gap(14),
                        Text(
                          mealItem.name ?? '',
                          style: TextStyles.black16SemiBold,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: AppColors.yellowColor,
                                    ),
                                    Text(
                                      mealItem.rate.toString(),
                                      style: TextStyles.black14Medium,
                                    ),
                                  ],
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: mealItem.price.toString(),
                                    style: TextStyles.black16Regular,
                                    children: const [
                                      TextSpan(
                                        text: ' SAR',
                                        style: TextStyles.primary14Regular,
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(12),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(8),
                              height: 45,
                              width: 45,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child:
                                  Image.asset(Assets.assetsIconsAddToCartIcon),
                            ),
                          ],
                        ),
                        const Gap(8),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          Hero(
            tag: mealItem.id.toString(),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                width: context.width * .225,
                child: CachedNetworkImageWidget(
                  url: mealItem.img ?? '',
                ),
              ),
            ),
          ),
          Positioned(
            top: 35,
            right: 0,
            child: AddToFavBtn(
              isLiked: mealItem.isFavorite,
              mealItem: mealItem,
            ),
          )
        ],
      ),
    );
  }
}
