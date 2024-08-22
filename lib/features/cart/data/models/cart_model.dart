class CartModel {
  final int? id;
  final int? itemId;
  final int? quantity;
  final double? price;
  final String? name;
  final String? img;
  final String? desc;

  CartModel({
    required this.id,
    required this.itemId,
    required this.quantity,
    required this.price,
    required this.name,
    required this.img,
    required this.desc,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      itemId: json['item_id'],
      quantity: json['qty'],
      price: double.tryParse(json['sale_price']) ?? 0.0,
      name: json['itemable']?['name'],
      img: json['itemable']?['image'],
      desc: json['itemable']?['details'],
    );
  }
}
