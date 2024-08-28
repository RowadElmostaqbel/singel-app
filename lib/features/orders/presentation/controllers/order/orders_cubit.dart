import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:single_resturant_app/features/orders/data/models/my_order_model.dart';
import 'package:single_resturant_app/features/orders/data/repo/order_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrderState> {
  final OrderRepo orderRepo;
  OrdersCubit(this.orderRepo) : super(OrderInitial());
  List<MyOrderModel> myOrders = [];
  Future<void> fetchMyOrders() async {
    emit(OrdersLoadingState());
    final result = await orderRepo.fetchMyOrders();
    result.fold(
      (failure) {
        log(
          name: 'my orders error',
          failure.msg.toString(),
        );
        emit(
          OrdersFailureState(
            error: failure.msg,
          ),
        );
      },
      (orders) {
        myOrders = orders;
        emit(
          OrdersLoadedState(),
        );
      },
    );
  }
}
