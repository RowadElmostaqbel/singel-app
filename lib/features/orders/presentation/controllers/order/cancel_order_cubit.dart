import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:single_resturant_app/features/orders/data/models/cancel_reason_model.dart';
import 'package:single_resturant_app/features/orders/data/repo/order_repo.dart';

part 'cancel_order_state.dart';

class CancelOrderCubit extends Cubit<CancelOrderState> {
  final OrderRepo orderRepo;
  CancelOrderCubit(this.orderRepo) : super(CancelOrderInitial());

  List<CancelReasonModel> cancelReasons = [];
  final TextEditingController reasonController = TextEditingController();

  Map<String, dynamic> data = {};

  addCancelReason({required int id, required String reason}) {
    if(id == 0) {
      data['cancelled_reason'] = reason;
    }else{
      data['order_cancelation_type_id'] = id;
      data['cancelled_reason'] = reason;
    }
  }


  clearCancelReasonData(){
    data = {};
  }

  fetchCancelReasons() async {
    emit(FetchCancelOrderReasonsLoadingState());
    final result = await orderRepo.fetchCancelOrderReasons();
    result.fold(
      (failure) {
        emit(
          FetchCancelOrderReasonsErrorState(
            error: failure.msg,
          ),
        );
      },
      (reasons) {
        cancelReasons = reasons
          ..add(
            CancelReasonModel(
              id: 0,
            ),
          );
        emit(
          FetchCancelOrderReasonsLoadedState(),
        );
      },
    );
  }

  cancelOrder({required String orderId}) async {
    emit(CancelOrderLoadingState());
    final result = await orderRepo.cancelOrder(orderId: orderId, data: data);
    result.fold(
      (failure) {
        emit(
          const CancelOrderStatus(
            status: false,
          ),
        );
      },
      (success) {
        emit(
          CancelOrderStatus(
            status: success,
          ),
        );
      },
    );
  }
}
