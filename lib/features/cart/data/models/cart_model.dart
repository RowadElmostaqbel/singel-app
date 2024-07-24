
import '../../../place_order/data/models/order_model.dart';

class CartModel {
  final List<OrderModel> orders;
  final bool isCouponApplied;
  final String couponCode;

  CartModel({
    required this.orders,
    required this.isCouponApplied,
    required this.couponCode,
  });

  CartModel copyWith({
    List<OrderModel>? orders,
    bool? isCouponApplied,
    String? couponCode,
  }) {
    return CartModel(
      orders: orders ?? this.orders,
      isCouponApplied: isCouponApplied ?? this.isCouponApplied,
      couponCode: couponCode ?? this.couponCode,
    );
  }
}
