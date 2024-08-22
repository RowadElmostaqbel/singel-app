
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/search/presentation/controllers/search_cubit.dart';

import '../../../home/presentation/widgets/popular_meal_list_item.dart';

class SearchResultsGridView extends HookWidget {
  final SearchCubit searchCubit;

  const SearchResultsGridView({
    super.key,
    required this.searchCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchResultState) {
          return GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              top: 12,
              right: 12,
              left: 12,
              bottom: 60,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: context.height * 0.001,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) => PopularMealListItem(
              categoryMealItem: state.searchResults[index],
              searchCubit: searchCubit,
              fromSearch: true,
            ),
            itemCount: state.searchResults.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
