import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/core/widgets/custom_toast_widget.dart';
import 'package:single_resturant_app/features/coupons/presentation/widgets/coupon_applied_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../cart/presentation/widgets/apply_coupon_widget.dart';
import '../controllers/coupon_cubit.dart';

class CouponView extends StatelessWidget {
  const CouponView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CouponCubit, CouponState>(
      listener: (context, state) {
        if (state is ApplyCouponErrorState) {
          showTaost('Coupon Is Invalid', AppColors.primaryColor);
        }
      },
      builder: (context, state) {
        if (state is ApplyCouponSuccessState) {
          return CouponAppliedWidget(
            couponModel: state.couponModel,
          );
        }
        return const ApplyCouponWidget();
      },
    );
  }
}
