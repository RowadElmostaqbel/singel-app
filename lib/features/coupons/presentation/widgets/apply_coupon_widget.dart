import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';

class ApplyCouponWidget extends StatelessWidget {
  const ApplyCouponWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.brightGreyColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    Assets.assetsIconsGift,
                    width: 15,
                  ),
                  hintText: 'Enter your coupon code',
                  hintStyle: TextStyles.grey14Regular,
                  contentPadding: const EdgeInsets.only(
                    bottom: 14,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const Gap(12),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Apply',
                style: TextStyles.white16SemiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
