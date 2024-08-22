
class CategoryModel {
  final int? id;
  final int? parentId;
  final int? restaurantId;
  final bool? isActive;
  final String? name;
  final String? desc;
  final String? img;


  CategoryModel({
    required this.id,
    required this.parentId,
    required this.restaurantId,
    required this.isActive,
    required this.name,
    required this.desc,
    required this.img,
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
          ,
     
    );
  }
}
