part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class AuthLoadingState extends UserState {}

final class AuthLoadedState extends UserState {}

final class AuthFailureState extends UserState {
  final String error;

  AuthFailureState({required this.error});
}
