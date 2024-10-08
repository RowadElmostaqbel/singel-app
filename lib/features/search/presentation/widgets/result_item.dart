import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/add_to_fav_btn.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';

import '../../../../core/utils/assets.dart';
import '../../../orders/presentation/views/make_order_view.dart';

class ResultItem extends StatelessWidget {
  final int index;
  const ResultItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context.navigateTo(
              MakeOrderView(
                heroTag: 'popularDishListItem$index',
                categoryMealItem: CategoryMealItem(
                  id: 1,
                  subCategoryId: 1,
                  restaurantId: 1,
                  isOrdered: false,
                  isActive: true,
                  isFavorite: false,
                  name: 'name',
                  desc: 'desc',
                  img: '',
                ),
              ),
            ),
        child: Container(
          clipBehavior: Clip.antiAlias,
          height: context.height * 0.23,
          width: context.width * .43,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.antiAlias,
                    height: constraints.maxHeight * .6,
                    width: constraints.maxWidth,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          Assets.assetsImagesSteak,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            height: 25,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  30,
                                ),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.yellowColor,
                                ),
                                Gap(6),
                                Text(
                                  '4.2',
                                  style: TextStyles.darkGrey14Regular,
                                ),
                              ],
                            )),
                        const AddToFavBtn(
                          isLiked: false,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 4),
                    child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Burger King',
                              style: TextStyles.darkGrey16SemiBold,
                            ),
                            Row(
                              children: [
                                const Text(
                                  '75',
                                  style: TextStyles.black18SemiBold,
                                ),
                                const Gap(2),
                                Text(
                                  'SAR',
                                  style: TextStyles.primary14Regular
                                      .copyWith(fontSize: 12),
                                ),
                                const Gap(6),
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     SizedBox(
                            //       height: 20,
                            //       width: 20,
                            //       child: Image.asset(
                            //         Assets.assetsIconsDeliveryIc,
                            //         color: AppColors.primaryColor,
                            //       ),
                            //     ),
                            //     const Gap(6),
                            //     Text(
                            //       'Fast delivery',
                            //       style: TextStyles.darkGrey14Regular.copyWith(
                            //         fontSize: 16,
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
