part of 'whishlist_cubit.dart';

sealed class WhishlistState  {
  const WhishlistState();

  
}

final class WhishlistInitial extends WhishlistState {}
final class FetchWishlistLoadingState extends WhishlistState {}
final class FetchWishlistLoadedState extends WhishlistState {}
final class FetchWishlistFailureState extends WhishlistState {
  final Failure failure;

  FetchWishlistFailureState({required this.failure});
}

final class WhishlistChangedState extends WhishlistState {
  final bool status;
  final int id;

  const WhishlistChangedState({required this.status,required this.id});
}
