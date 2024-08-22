part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class EditProfileLoadingState extends ProfileState {}

final class EditProfileSuccessState extends ProfileState {}

final class EditProfileFailureState extends ProfileState {
  final String error;

  const EditProfileFailureState({required this.error});
}
