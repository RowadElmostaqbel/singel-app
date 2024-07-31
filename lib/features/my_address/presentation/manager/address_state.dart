part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class AddAddressState extends AddressState{

}
final class RemoveAddressState extends AddressState{}
