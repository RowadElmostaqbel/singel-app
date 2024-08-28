class CategoryMealItem {
  final int? id;
  final int? subCategoryId;
  dynamic price;
  dynamic preparationTime;
  dynamic details;
  final int? restaurantId;
  final bool? isActive;
  final bool? isOrdered;
  bool isFavorite;
  final String? name;
  final String? desc;
  final String? img;
  dynamic rate;
  SubCategoryModel? subCategoryModel;
  CategoryMealItem({
    required this.id,
    required this.subCategoryId,
    required this.restaurantId,
    required this.isActive,
    required this.isFavorite,
    required this.isOrdered,
    required this.name,
    required this.desc,
    required this.img,
    this.price,
    this.preparationTime,
    this.details,
    this.rate,
    this.subCategoryModel,
  });

  factory CategoryMealItem.fromJson(Map<String, dynamic> json) {
    return CategoryMealItem(
      id: json['id'],
      subCategoryId: json['subCategoryId'],
      restaurantId: json['restaurantId'],
      isActive: json['is_active'] == 1 ? true : false,
      isFavorite: json['isFavourite'] ?? false,
      isOrdered: json['isOrdered'] ?? false,
      name: json['name'],
      desc: json['description'],
      img: json['image'].toString(),
      price: json['price'],
      preparationTime: json['preparation_time'],
      details: json['details'],
      rate: json['rate'],
      subCategoryModel: SubCategoryModel.fromJson(
        json['sub_category'] ?? {},
      ),
    );
  }
}

class SubCategoryModel {
  final int? id;
  final String? name;

  SubCategoryModel({required this.id, required this.name});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
