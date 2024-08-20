import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:single_resturant_app/features/orders/data/repo/order_repo.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo orderRepo;
  OrderCubit(this.orderRepo) : super(OrderInitial());
}
