part of 'contact_us_cubit.dart';

@immutable
sealed class ContactUsState {
  const ContactUsState();
  @override
  List<Object> get props => [];


}

final class ContactUsInitial extends ContactUsState {}

final class ContactUsLoadingState extends ContactUsState {}

final class ContactUsSuccessState extends ContactUsState {}

final class ContactUsFailureState extends ContactUsState {
  final String error;

  const ContactUsFailureState({required this.error});
}
