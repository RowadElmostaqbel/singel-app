import 'package:dartz/dartz.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/features/coupons/data/models/coupon_model.dart';

abstract class CouponRepo{
  Future<Either<Failure,CouponModel>>applyCoupon({required String code});
}