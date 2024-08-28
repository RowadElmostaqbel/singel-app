part of 'orders_cubit.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class OrdersLoadingState extends OrderState {}

final class OrdersLoadedState extends OrderState {}

final class OrdersFailureState extends OrderState {
  final String error;

  const OrdersFailureState({required this.error});
}
