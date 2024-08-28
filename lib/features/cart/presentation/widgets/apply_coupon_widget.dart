
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_btn_widget.dart';

class ApplyCouponWidget extends StatelessWidget {
  const ApplyCouponWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        const CustomBtnWidget(
          color: AppColors.primaryColor,
          text: 'Apply',
          titleStyle: TextStyles.white16Medium,
        ),
      ],
    );
  }
}
