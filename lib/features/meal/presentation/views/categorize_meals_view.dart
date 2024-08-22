import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/features/meal/presentation/widgets/custom_search_and_filter_widget.dart';
import '../../../home/presentation/widgets/categories_list_view.dart';
import '../widgets/meals_by_sub_category_grid_view.dart';
import '../widgets/sub_category_list_view.dart';

class CategorizeMealsView extends StatelessWidget {
  const CategorizeMealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(),
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: GestureDetector(
        //     onTap: () => context.pop(),
        //     child: Container(
        //       alignment: Alignment.center,
        //       width: 35,
        //       height: 35,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(12),
        //         color: Colors.white,
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.grey.withOpacity(.5),
        //             blurRadius: 10,
        //             offset: const Offset(0, 5),
        //           ),
        //         ],
        //       ),
        //       child: const Icon(
        //         Icons.arrow_back_ios_rounded,
        //         size: 15,
        //         color: AppColors.primaryColor,
        //       ),
        //     ),
        //   ),
        // ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            height: 40,
            width: 40,
            child: Image.asset(
              Assets.assetsIconsQrIc,
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Menu',
              style: TextStyles.black20SemiBold,
            ),
            Gap(20),
            CustomSearchAndFilterWidget(),
            Gap(20),
            SizedBox(
              height: 100,
              child: CategoriesListView(),
            ),
            Gap(20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 165,
                      child: SubCategoryListView(),
                    ),
                    Gap(20),
                    MealsBySubCategoryGridView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
