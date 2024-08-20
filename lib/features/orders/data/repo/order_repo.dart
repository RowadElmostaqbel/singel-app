import 'package:dartz/dartz.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/features/orders/data/models/my_order_model.dart';

abstract class OrderRepo {
  Future<Either<Failure,List<MyOrderModel>>>fetchMyOrders();
}