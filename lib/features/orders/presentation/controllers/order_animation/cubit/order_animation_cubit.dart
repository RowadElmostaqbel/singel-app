import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:single_resturant_app/features/orders/data/models/order_model.dart';

part 'order_animation_state.dart';

class OrderAnimationCubit extends Cubit<OrderAnimationState> {
  OrderAnimationCubit() : super(OrderAnimationInitial());

  final GlobalKey basketKey = GlobalKey();

  List<OrderModel> orders = [];

  addOrdersToAnimationList(OrderModel order) {
    orders.add(order);
    if (orders.length == 1) {
      emit(
        AddingOrderAnimationState(
          orders: orders,
        ),
      );
    } else {
      emit(
        OrderAnimationStateChanged(
          orders: orders,
        ),
      );
    }
  }

  removeItemsFromAnimationList() {
    if (orders.isNotEmpty) {
      orders.removeAt(0);
      if (orders.isEmpty) {
        emit(
          RemovingOrderAnimationState(
            orders: orders,
          ),
        );
      }
    }
  }
}
