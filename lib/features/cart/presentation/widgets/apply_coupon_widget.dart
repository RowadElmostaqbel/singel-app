import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/features/coupons/presentation/controllers/coupon_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_btn_widget.dart';

class ApplyCouponWidget extends HookWidget {
  const ApplyCouponWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController codeController = useTextEditingController();
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 16),
            height: 48,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xffF4F4F4),
            ),
            child: TextField(
              controller: codeController,
              decoration: InputDecoration(
                prefixIcon: Image.asset(
                  Assets.assetsIconsGift,
                ),
                border: InputBorder.none,
                hintText: 'Enter your coupon code',
                hintStyle: TextStyles.brightBlack17Medium,
              ),
            ),
          ),
        ),
        CustomBtnWidget(
          color: AppColors.primaryColor,
          text: 'Apply',
          titleStyle: TextStyles.white16Medium,
          onTap: () {
            context.read<CouponCubit>().applyCoupon(codeController.text);
          },
        ),
      ],
    );
  }
}
