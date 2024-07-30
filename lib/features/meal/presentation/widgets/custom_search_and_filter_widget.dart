
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../filter/presentation/views/filter_view.dart';
import '../../../search/presentation/views/search_view.dart';

class CustomSearchAndFilterWidget extends StatelessWidget {
  const CustomSearchAndFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: GestureDetector(
              onTap: () {
                //showSearch(context: context, delegate: CustomSearchDelegate());
                context.navigateTo(const SearchView());
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.brightGreyColor,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          Assets.assetsIconsSearch,
                        ),
                      ),
                      const Text(
                        'Search food ...',
                        style: TextStyles.brightBlack17Medium,
                      ),
                    ],
                  )),
            ),
          ),
          const Gap(12),
          Expanded(
            child: GestureDetector(
              onTap: () => context.navigateTo(const FilterView()),
              child: Container(
                padding: const EdgeInsets.all(
                  12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Image.asset(
                  Assets.assetsIconsFilterIc,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
