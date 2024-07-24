
import '../../../meal/data/models/meal_model.dart';

class OrderModel {
  final MealModel meal;
  final int quantity;

  OrderModel({required this.meal, required this.quantity});

  OrderModel copyWith({
    MealModel? meal,
    int? quantity,
  }) =>
      OrderModel(
        meal: meal ?? this.meal,
        quantity: quantity ?? this.quantity,
      );
}
