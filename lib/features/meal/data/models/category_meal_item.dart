class CategoryMealItem {
  final int? id;
  final int? subCategoryId;
  dynamic price;
  dynamic preparationTime;
  dynamic details;
  final int? restaurantId;
  final bool? isActive;
  final String? name;
  final String? desc;
  final String? img;

  CategoryMealItem({
    required this.id,
    required this.subCategoryId,
    required this.restaurantId,
    required this.isActive,
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
      isActive: json['isActive'] == 1 ? true : false,
      name: json['name'],
      desc: json['description'],
      img: json['image'].toString().replaceAll(
          'https://deliback.rowaduae.com/storage/https://images.app.goo.gl/ZUg15YFWTPmd8oRd7',
          ''),
      price: json['price'],
      preparationTime: json['preparation_time'],
      details: json['details'],
    );
  }
}
