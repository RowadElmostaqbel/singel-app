import 'package:single_resturant_app/features/my_address/data/models/addresses.dart';

class MyOrderModel {
  final int id;
  final String date;
  final String orderType;
  final String orderStatus;
  final String price;
  final List<OrderItemModel> orderItems;
  final AddressModel address;

  MyOrderModel({
    required this.id,
    required this.date,
    required this.orderType,
    required this.orderStatus,
    required this.price,
    required this.orderItems,
    required this.address,
  });

  factory MyOrderModel.fromJson(Map<String, dynamic> json) {
    return MyOrderModel(
      id: json['id'],
      date: json['created_at'],
      orderType: json['order_type'],
      orderStatus: json['order_status'],
      price: json['total_price'],
      orderItems: List<OrderItemModel>.from(
        json['details'].map(
          (x) => OrderItemModel.fromJson(
            x,
          ),
        ),
      ),
      address: AddressModel.fromJson(
        json['client_address'],
      ),
    );
  }
}

class OrderItemModel {
  final int? id;
  final String? name;
  final String? category;
  final String? image;
  final dynamic price;
  final int? quantity;

  OrderItemModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.category,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      price: json['sale_price'],
      quantity: json['qty'],
      id: json['item']?['id'],
      name: json['item']?['name'],
      category: json['item']?['category'],
      image: json['item']?['image'],
    );
  }
}
