class AddToCartDataModel {
  final String itemId;
  final String quantity;

  AddToCartDataModel({
    required this.itemId,
    required this.quantity,
  });


  toJson() {
    return {
      "item_id": itemId,
      "qty": quantity,
    };
  }
}
