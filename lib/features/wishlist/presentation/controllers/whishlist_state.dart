part of 'whishlist_cubit.dart';

sealed class WhishlistState  {
  const WhishlistState();

  
}

final class WhishlistInitial extends WhishlistState {}

final class WhishlistChangedState extends WhishlistState {
  final bool status;
  final int id;

  const WhishlistChangedState({required this.status,required this.id});
}
