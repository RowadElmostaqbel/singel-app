import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:single_resturant_app/features/coupons/data/models/coupon_model.dart';
import 'package:single_resturant_app/features/coupons/data/repos/coupon_repo.dart';

part 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  final CouponRepo couponRepo;
  CouponCubit(this.couponRepo) : super(CouponInitial());

  resetCoupon() {
    emit(CouponInitial());
  }

  applyCoupon(String code) async {
    emit(ApplyCouponLoadingState());
    final result = await couponRepo.applyCoupon(code: code);
    result.fold((failure) {
      emit(
        ApplyCouponErrorState(),
      );
    }, (coupon) {
      emit(
        ApplyCouponSuccessState(
          couponModel: coupon,
        ),
      );
    });
  }
}
