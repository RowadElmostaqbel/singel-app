import 'package:single_resturant_app/core/utils/extensions.dart';

class CouponModel {
  final int? id;
  final String? code;
  final String? name;
  final CouponType type;
  dynamic value;

  CouponModel({
    required this.id,
    required this.code,
    required this.name,
    required this.type,
    this.value,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      type: json['type'].toString().toCouponType(),
      value: json['value'],
    );
  }
}


enum CouponType { percentage, fixed }