class CategoryMealItem {
  final int? id;
  final int? subCategoryId;
  dynamic price;
  dynamic preparationTime;
  dynamic details;
  final int? restaurantId;
  final bool? isActive;
   bool isFavorite;
  final String? name;
  final String? desc;
  final String? img;

  CategoryMealItem({
    required this.id,
    required this.subCategoryId,
    required this.restaurantId,
    required this.isActive,
    required this.isFavorite,
    required this.name,
    required this.desc,
    required this.img,
    this.price,
    this.preparationTime,
    this.details,
  });

  factory CategoryMealItem.fromJson(Map<String, dynamic> json) {
    return CategoryMealItem(
      id: json['id'],
      subCategoryId: json['subCategoryId'],
      restaurantId: json['restaurantId'],
      isActive: json['is_active'] == 1 ? true : false,
      isFavorite: json['isFavourite']??false ,
      name: json['name'],
      desc: json['description'],
      img: json['image'].toString(),
      price: json['price'],
      preparationTime: json['preparation_time'],
      details: json['details'],
    );
  }
}
