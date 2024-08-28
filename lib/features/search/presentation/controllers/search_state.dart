part of 'search_cubit.dart';

sealed class SearchState  {
  const SearchState();


}

final class SearchInitial extends SearchState {
   final List<String> recentSearchQueries;

  const SearchInitial({required this.recentSearchQueries});
}

final class RececntSearchQueriesChangedState extends SearchState {
  final List<String> recentSearchQueries;

  const RececntSearchQueriesChangedState({required this.recentSearchQueries});
}

final class SearchResultState extends SearchState {
  final List<CategoryMealItem> searchResults;

  const SearchResultState({required this.searchResults});
}
