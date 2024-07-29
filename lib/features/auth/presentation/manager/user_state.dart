part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}
final class AuthLoadingState extends UserState {}
final class AuthLoadedState extends UserState {}
final class AuthFailureState extends UserState {}

final class AddUser extends UserState {
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final TextEditingController mobile;
  final TextEditingController userName;

  AddUser(
      {required this.email,
      required this.password,
      required this.confirmPassword,
      required this.mobile,
      required this.userName});

  AddUser copyWith({
    TextEditingController? email,
    TextEditingController? password,
    TextEditingController? confirmPassword,
    TextEditingController? mobile,
    TextEditingController? userName,
  }) {
    return AddUser(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        mobile: mobile ?? this.mobile,
        userName: userName ?? this.userName);
  }
}
