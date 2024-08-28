import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/core/utils/constants.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';
import 'package:single_resturant_app/features/search/data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final CacheServiceHeper cacheServiceHeper;
  final TextEditingController searchController = TextEditingController();
  final SearchRepo searchRepo;
  SearchCubit(
    this.cacheServiceHeper,
    this.searchRepo,
  ) : super(
          const SearchInitial(
            recentSearchQueries: [],
          ),
        );

  search(String query) async {
    final res = await searchRepo.search(query);

    res.fold((error) {
      emit(
        const SearchResultState(
          searchResults: [],
        ),
      );
    }, (results) {
      emit(
        SearchResultState(
          searchResults: results,
        ),
      );
    });
  }

  modifyRecentSearchQueries(String query) {
    List<String> queries = fetchRecentSearchQueries();
    queries.add(query);
    cacheServiceHeper.storeData<List<String>>(
        data: queries, boxName: Constants.recentQueryBox, key: 'recentSearchQueries');
    emit(
      RececntSearchQueriesChangedState(
        recentSearchQueries: queries,
      ),
    );
  }

  fetchRecentSearchQueries() {
    List<String> queries = cacheServiceHeper.getData<List<String>>(
            boxName: Constants.recentQueryBox, key: 'recentSearchQueries') ??
        [];
    return queries;
  }

  clearRecentSearchQueries() {
    cacheServiceHeper.storeData<List<String>>(
        data: [], boxName: Constants.recentQueryBox, key: 'recentSearchQueries');
    emit(
      const RececntSearchQueriesChangedState(
        recentSearchQueries: [],
      ),
    );
  }
}
