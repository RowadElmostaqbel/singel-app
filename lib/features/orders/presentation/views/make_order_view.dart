import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';
import 'package:single_resturant_app/features/orders/data/models/order_model.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../home/presentation/widgets/add_to_fav_btn.dart';
import '../../../comments/presentation/views/client_reviews_list_view.dart';
import '../controllers/order_animation/cubit/order_animation_cubit.dart';
import '../widgets/add_to_basket_animation_widget.dart';
import '../widgets/add_to_cart_bottom_sheet.dart';
import '../widgets/animated_basket_widget.dart';
import '../widgets/meal_size_list_view.dart';

class MakeOrderView extends HookWidget {
  final CategoryMealItem categoryMealItem;

  final String heroTag;

  const MakeOrderView({
    super.key,
    required this.heroTag,
    required this.categoryMealItem,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = useScrollController();

    useEffect(() {
      // Future.delayed(Duration.zero, () {
      //   context.read<CartCubit>().changeOrderDetails(
      //         orderModel: OrderModel(
      //           meal: categoryMealItem,
      //           quantity: 1,
      //         ),
      //         sides: null,
      //       );
      // });
      return null;
    }, []);
    return Scaffold(
      bottomSheet: AddToCartBottomSheet(
        orderModel: OrderModel(meal: categoryMealItem, quantity: 1),
      ),
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (_, __) => [
          SliverAppBar(
            pinned: true,
            leading: const SizedBox(),
            expandedHeight: context.height * .275,
            collapsedHeight: context.height * .15,
            flexibleSpace: Stack(
              children: [
                Hero(
                  tag: heroTag,
                  child: SizedBox(
                    width: context.width,
                    child: CachedNetworkImageWidget(
                      url: categoryMealItem.img ?? '',
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => context.pop(),
                          child: Container(
                            alignment: Alignment.center,
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.5),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: AppColors.primaryColor,
                              size: 15,
                            ),
                          ),
                        ),
                        AddToFavBtn(
                          mealId: categoryMealItem.id.toString(),
                          isLiked: categoryMealItem.isFavorite ,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 15,
                    width: context.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              categoryMealItem.name ?? '',
                              style: TextStyles.black24SemiBold,
                            ),
                            const Text(
                              '⭐ 4.9',
                              style: TextStyles.black16SemiBold,
                            )
                          ],
                        ),
                        const Gap(16),
                        RichText(
                          text: TextSpan(
                            text: categoryMealItem.price.toString(),
                            style: TextStyles.black24SemiBold,
                            children: const [
                              TextSpan(
                                text: ' SAR',
                                style: TextStyles.primary14Regular,
                              ),
                            ],
                          ),
                        ),
                        const Gap(16),
                        RichText(
                          text: const TextSpan(
                            text: 'Category : ',
                            style: TextStyles.black18Light,
                            children: [
                              TextSpan(
                                text: 'Burger',
                                style: TextStyles.black18Medium,
                              ),
                            ],
                          ),
                        ),
                        const Gap(16),
                        Text(
                          categoryMealItem.details ?? '',
                          style: TextStyles.darkGrey16SemiBold,
                        ),
                        const Gap(20),
                        const Text(
                          'Select Size',
                          style: TextStyles.black18SemiBold,
                        ),
                        const Gap(12),
                        const MealSizeListView(),
                        const Gap(36),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     const Text(
                        //       'Ingredients',
                        //       style: TextStyles.black18SemiBold,
                        //     ),
                        //     Container(
                        //       alignment: Alignment.center,
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 12, vertical: 8),
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(20),
                        //         color: AppColors.darkPrimaryColor,
                        //       ),
                        //       child: const Text(
                        //         'Reset',
                        //         style: TextStyles.white14Medium,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // const Gap(16),
                        // const Text(
                        //   'Modify your addition and select what you like',
                        //   style: TextStyles.grey16Medium,
                        // ),
                        // const Gap(10),
                        // SizedBox(
                        //   height: 100,
                        //   child: ListView.separated(
                        //     scrollDirection: Axis.horizontal,
                        //     itemBuilder: (context, index) => IngredientListItem(
                        //       ingredient: mealModel.ingredients[index],
                        //     ),
                        //     separatorBuilder: (context, index) => const Gap(16),
                        //     itemCount: mealModel.ingredients.length,
                        //   ),
                        // ),
                        // const Gap(32),
                        // const Text(
                        //   'Add-ons',
                        //   style: TextStyles.black18SemiBold,
                        // ),
                        // const Gap(16),
                        // SizedBox(
                        //   height: 100,
                        //   child: ListView.separated(
                        //     scrollDirection: Axis.horizontal,
                        //     itemBuilder: (context, index) => IngredientListItem(
                        //       ingredient: mealModel.ingredients[index],
                        //     ),
                        //     separatorBuilder: (context, index) => const Gap(16),
                        //     itemCount: mealModel.ingredients.length,
                        //   ),
                        // ),
                        // const Gap(32),
                        // const AddDrinksListView(),
                        // const Gap(32),
                        // AddSidesListView(
                        //   sideItems: mealModel.sides,
                        // ),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Client’s Review',
                          style: TextStyles.black18SemiBold,
                        ),
                        Text(
                          'See more',
                          style: TextStyles.primary16Medium,
                        ),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Gap(24),
                  ),
                  const ClientReviewsListView(),
                  const SliverToBoxAdapter(
                    child: Gap(110),
                  ),
                ],
              ),
              const AnimatedBasketWidget(),
              Stack(
                children: context
                    .watch<OrderAnimationCubit>()
                    .orders
                    .map(
                      (e) => const AddToBasketAnimationWidget(),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
