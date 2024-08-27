part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class FetchAddressLoadingState extends AddressState {}

final class FetchAddressFailureState extends AddressState {
  final String message;

  FetchAddressFailureState({required this.message});
}

final class FetchAddressSuccessState extends AddressState {}

final class SendAddressToServerLoadingState extends AddressState {}

final class SendAddressToServerLoadedState extends AddressState {
  final bool status;

  SendAddressToServerLoadedState({required this.status});
}

final class SendAddressToServerFailureState extends AddressState {
  final String message;

  SendAddressToServerFailureState({required this.message});
}

final class DeleteAddress extends AddressState {}
