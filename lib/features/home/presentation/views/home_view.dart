import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/categories_list_view.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/client_reviews_list_view.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/custom_search_and_filter_widget.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/fast_delivary_list_view.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/offers_list_view.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/popular_meals_list_view.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/popular_resturants_list_view.dart';

import '../../../../core/utils/text_styles.dart';
import '../widgets/banners_view.dart';

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        leadingWidth: 70,
        actions: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              right: 10,
            ),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Text(
              'AR',
              style: TextStyles.primary18SemiBold.copyWith(fontSize: 14),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.brightGreyColor.withOpacity(.6),
            ),
            child: Image.asset(
              Assets.assetsIconsNotificationIc,
              fit: BoxFit.fill,
            ),
          ),
        ],
        leading: Row(
          children: [
            const Gap(10),
            CircleAvatar(
              radius: 30,
              child: Image.asset(Assets.assetsImagesProfile),
            ),
          ],
        ),
        // centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mohamed Omar',
              style: TextStyles.black16SemiBold,
            ),
            InkWell(
              onTap: () {
                // showDialog(
                //   context: context,
                //   builder: (context) => LocationView(
                //     buildContext: context,
                //   ),
                // );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: Image.asset(
                      Assets.assetsIconsLocationSolidIcon,
                    ),
                  ),
                  const Gap(8),
                  const Expanded(
                    child: Text(
                      'EL Hoda We Elnoor, Street',
                      style: TextStyles.darkGrey14Regular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Gap(30),
            ),
            const SliverToBoxAdapter(
              child: BannersView(),
            ),
            const SliverToBoxAdapter(
              child: Gap(24),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: CategoriesListView(),
              ),
            ),
            const SliverToBoxAdapter(
              child: Gap(24),
            ),
            const SliverToBoxAdapter(
              child: PopularMealsListView(),
            ),
            const SliverToBoxAdapter(
              child: Gap(24),
            ),
            const SliverToBoxAdapter(
              child: OffersListVIew(),
            ),
            const SliverToBoxAdapter(
              child: Gap(24),
            ),
            // SliverToBoxAdapter(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Text(
            //         'Client’s Review',
            //         style: TextStyles.black18SemiBold,
            //       ),
            //       GestureDetector(
            //         // onTap: () => context.navigateTo(
            //         //   const AllOffersView(),
            //         // ),
            //         child: Container(
            //           alignment: Alignment.center,
            //           padding: const EdgeInsets.symmetric(
            //             horizontal: 8,
            //             vertical: 4,
            //           ),
            //           height: 40,
            //           decoration: BoxDecoration(
            //             color: AppColors.primaryColor.withOpacity(.1),
            //             borderRadius: BorderRadius.circular(6),
            //           ),
            //           child: Row(
            //             children: [
            //               Container(
            //                 alignment: Alignment.center,
            //                 height: 20,
            //                 width: 20,
            //                 decoration: const BoxDecoration(
            //                   color: Colors.white,
            //                   shape: BoxShape.circle,
            //                 ),
            //                 child: const FittedBox(
            //                   child: Icon(
            //                     Icons.add,
            //                     color: AppColors.primaryColor,
            //                   ),
            //                 ),
            //               ),
            //               const Gap(8),
            //               const Text(
            //                 'Add New',
            //                 style: TextStyles.primary14Regular,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const SliverToBoxAdapter(
            //   child: Gap(24),
            // ),
            // const ClientReviewsListView(),
            SliverToBoxAdapter(
              child: Gap(context.height * .06),
            ),
          ],
        ),
      ),
    );
  }
}
