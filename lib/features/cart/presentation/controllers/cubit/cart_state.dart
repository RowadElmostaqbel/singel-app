part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class SendCartToServerLoadingState extends CartState {}

final class SendCartToServerLoadedState extends CartState {
  final bool status;

  SendCartToServerLoadedState({required this.status});
}

final class SendCartToServerFailureState extends CartState {
  final String message;
  SendCartToServerFailureState({required this.message});
}

final class OrderDetailsChangedState extends CartState {
  final OrderModel? orderModel;

  OrderDetailsChangedState({required this.orderModel});
}

final class CartItemChangedState extends CartState {
  final CartModel cartModel;

  CartItemChangedState({required this.cartModel});
}
