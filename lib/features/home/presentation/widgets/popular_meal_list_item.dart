import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/add_to_fav_btn.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';
import 'package:single_resturant_app/features/search/presentation/controllers/search_cubit.dart';

import '../../../../core/utils/assets.dart';
import '../../../orders/presentation/views/make_order_view.dart';

class PopularMealListItem extends StatelessWidget {
  final SearchCubit? searchCubit;
  final CategoryMealItem categoryMealItem;
  final bool fromSearch;
  const PopularMealListItem({
    super.key,
    required this.categoryMealItem,
    this.fromSearch = false,
    this.searchCubit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (searchCubit != null) {
            searchCubit!.modifyRecentSearchQueries(categoryMealItem.name ?? '');
          }
          context.navigateTo(
            MakeOrderView(
              heroTag: categoryMealItem.id.toString(),
              categoryMealItem: categoryMealItem,
            ),
          );
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          width: context.width * .55,
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
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          categoryMealItem.img ?? '',
                        ),
                        fit: BoxFit.fitWidth,
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
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColors.yellowColor,
                                ),
                                const Gap(6),
                                Text(
                                  categoryMealItem.rate.toString(),
                                  style: TextStyles.darkGrey14Regular,
                                ),
                              ],
                            )),
                        AddToFavBtn(
                          mealItem: categoryMealItem,
                          isLiked: categoryMealItem.isFavorite,
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
                            Text(
                              categoryMealItem.name ?? '',
                              style: TextStyles.darkGrey16SemiBold,
                            ),
                            Row(
                              children: [
                                Text(
                                  categoryMealItem.price.toString(),
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
