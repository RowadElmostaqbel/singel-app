import 'package:flutter/material.dart';

import '../../features/coupons/data/models/coupon_model.dart';

extension SizeHelper on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension NavigationHelper on BuildContext {
  Future<T?> navigateTo<T>(Widget widget) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (context) => widget));

  Future<T?> navigateToReplacement<T>(Widget widget) => Navigator.of(this)
      .pushReplacement(MaterialPageRoute(builder: (context) => widget));

  void pop<T>([T? result]) => Navigator.of(this).pop(result);
}

extension StringHelper on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

}

extension EnumHelper on String?{
  CouponType toCouponType(){
    switch(this){
      case "percentage":
        return CouponType.percentage;
      case "fixed":
        return CouponType.fixed;
      default:
        return CouponType.percentage;
    }
  }
}
