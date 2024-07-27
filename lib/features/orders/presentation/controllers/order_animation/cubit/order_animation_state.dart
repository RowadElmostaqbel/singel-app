part of 'order_animation_cubit.dart';

@immutable
sealed class OrderAnimationState {}

final class OrderAnimationInitial extends OrderAnimationState {}

final class OrderAnimationStateChanged extends OrderAnimationState {
  final List<OrderModel> orders;

  OrderAnimationStateChanged({required this.orders});
}


final class AddingOrderAnimationState extends OrderAnimationState {
  final List<OrderModel> orders;

  AddingOrderAnimationState({required this.orders});
}

final class RemovingOrderAnimationState extends OrderAnimationState {
  final List<OrderModel> orders;

  RemovingOrderAnimationState({required this.orders});
}
