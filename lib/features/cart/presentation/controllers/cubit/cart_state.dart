part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class OrderDetailsChangedState extends CartState {
  final OrderModel? orderModel;

  OrderDetailsChangedState({required this.orderModel});
}

final class CartItemChangedState extends CartState {
  final CartModel cartModel;

  CartItemChangedState({required this.cartModel});
}
