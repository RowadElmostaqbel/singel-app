import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';

class CategoryModel {
  final int? id;
  final int? parentId;
  final int? restaurantId;
  final bool? isActive;
  final String? name;
  final String? desc;
  final String? img;

  final List<CategoryMealItem> items;

  CategoryModel({
    required this.id,
    required this.parentId,
    required this.restaurantId,
    required this.isActive,
    required this.name,
    required this.desc,
    required this.img,
    required this.items,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      parentId: json['parent_id'],
      restaurantId: json['restaurant_id'],
      isActive: json['is_active'] == "1" ? true : false,
      name: json['name'],
      desc: json['description'],
      img: json['image']
          .toString()
          .replaceFirst('https://deliback.rowaduae.com/storage/', ''),
      items: (json['items'] != null && json['items'].isNotEmpty)
          ? (json['items'] as List)
              .map((item) => CategoryMealItem.fromJson(item))
              .toList()
          : [],
    );
  }
}
