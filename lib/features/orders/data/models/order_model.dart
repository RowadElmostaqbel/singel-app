
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';


class OrderModel {
  final CategoryMealItem meal;
  final int quantity;

  OrderModel({required this.meal, required this.quantity});

  OrderModel copyWith({
    CategoryMealItem? meal,
    int? quantity,
  }) =>
      OrderModel(
        meal: meal ?? this.meal,
        quantity: quantity ?? this.quantity,
      );


      
}
