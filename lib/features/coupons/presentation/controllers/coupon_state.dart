part of 'coupon_cubit.dart';

sealed class CouponState extends Equatable {
  const CouponState();

  @override
  List<Object> get props => [];
}

final class CouponInitial extends CouponState {}

final class ApplyCouponSuccessState extends CouponState {
  final CouponModel couponModel;

  const ApplyCouponSuccessState({required this.couponModel});
}

final class ApplyCouponLoadingState extends CouponState {}

final class ApplyCouponErrorState extends CouponState {}
