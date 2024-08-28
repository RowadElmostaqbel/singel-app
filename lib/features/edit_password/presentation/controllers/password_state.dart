part of 'password_cubit.dart';

@immutable
sealed class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

final class PasswordInitial extends PasswordState {}

final class EditPasswordLoadingState extends PasswordState {}

final class EditPasswordSuccessState extends PasswordState {}

final class EditPasswordFailureState extends PasswordState {
  final String error;

  const EditPasswordFailureState({required this.error});
}