import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/search/presentation/widgets/search_results_grid_view.dart';

import '../../../../core/utils/cache_service.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../home/presentation/widgets/popular_meal_list_item.dart';
import '../../data/repo/search_repo.dart';
import '../controllers/search_cubit.dart';
import '../widgets/recent_search_queries_grid_view.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/custom_spacer.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static SearchCubit searchCubit = SearchCubit(
    ServiceLocatorHelper.getIt<CacheServiceHeper>(),
    ServiceLocatorHelper.getIt<SearchRepo>(),
  );
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 34,
                ),
                const CustomSearchBar(),
                const SizedBox(
                  height: 8,
                ),

                RecentSearchQueriesGridView(
                  searchCubit,
                ),
                const Gap(12),
                Expanded(
                  child: SearchResultsGridView(
                    searchCubit: searchCubit,
                  ),
                ),
                // const CustomSpacer(),
                // const Text(
                //   "Suggest",
                //   style: TextStyles.black18Medium,
                // ),
                // const CustomGridViewElements(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
