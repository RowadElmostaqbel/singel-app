import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/features/search/presentation/controllers/search_cubit.dart';

import 'custom_spacer.dart';

class RecentSearchQueriesGridView extends HookWidget {
  final SearchCubit searchCubit;

  const RecentSearchQueriesGridView(this.searchCubit, {super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      log('message');
      searchCubit.fetchRecentSearchQueries();
      return null;
    }, []);
    ValueNotifier<List<String>> recentSearchQueries = useState([]);
    return BlocBuilder<SearchCubit, SearchState>(
      bloc: searchCubit,
      builder: (context, state) {
        if (state is RececntSearchQueriesChangedState) {
          recentSearchQueries.value =
              state.recentSearchQueries.reversed.take(6).toList();
        }
        if (recentSearchQueries.value.isNotEmpty) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent",
                    style: TextStyles.black18Medium,
                  ),
                  InkWell(
                    onTap: () {
                      searchCubit.clearRecentSearchQueries();
                    },
                    child: const Text(
                      "Delete all",
                      style: TextStyles.black18Medium,
                    ),
                  ),
                ],
              ),
              const CustomSpacer(),
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: context.width,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recentSearchQueries.value.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.read<SearchCubit>().searchController.text =
                            recentSearchQueries.value[index];
                        context
                            .read<SearchCubit>()
                            .search(recentSearchQueries.value[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.brightGreyColor,
                        ),
                        child: Center(
                          child: Text(
                            recentSearchQueries.value[index],
                            style: TextStyles.black16Medium,
                          ),
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 50,
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
