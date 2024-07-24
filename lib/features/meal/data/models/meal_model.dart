import 'package:equatable/equatable.dart';

class MealModel {
  final String name;
  final String desc;
  final String img;
  final double price;
  List<SideItemModel> sides;
  List<AddOnsModel> addOns;
  List<IngredientsModel> ingredients;

  MealModel({
    required this.name,
    required this.desc,
    required this.img,
    required this.price,
    required this.addOns,
    required this.sides,
    required this.ingredients,
  });


  MealModel copyWith({
    String? name,
    String? desc,
    String? img,
    double? price,
    List<SideItemModel>? sides,
    List<AddOnsModel>? addOns,
    List<IngredientsModel>? ingredients,
  }){
    return MealModel(
      name: name ?? this.name,
      desc: desc ?? this.desc,
      img: img ?? this.img,
      price: price ?? this.price,
      sides: sides ?? this.sides,
      addOns: addOns ?? this.addOns,
      ingredients: ingredients ?? this.ingredients,
    );
  }
}

class SideItemModel extends Equatable {
  final String name;
  final String desc;
  final String img;
  final double price;

  const SideItemModel({
    required this.name,
    required this.desc,
    required this.img,
    required this.price,
  });

  @override
  List<Object?> get props => [name, desc, img, price];
}

class AddOnsModel {
  final String name;
  final String img;

  AddOnsModel({required this.name, required this.img});
}

class IngredientsModel {
  final String name;
  final String img;

  IngredientsModel({required this.name, required this.img});
}
