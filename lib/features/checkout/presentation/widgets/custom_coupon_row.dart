import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';

import '../../../../core/utils/app_colors.dart';

class CustomCouponRow extends StatelessWidget {
  const CustomCouponRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const ApplyCouponWidget();
  }
}

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

class CouponAppliedWidget extends StatelessWidget {
  const CouponAppliedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            color: const Color(0xffF4F4F4),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Image.asset("assets/icons/coupons.png"),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 47,
          width: MediaQuery.sizeOf(context).width * 0.5,
          decoration: BoxDecoration(
            color: const Color(0xffFD784D).withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "YEH ! you saved  15 SAR",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14),
                  ),
                  Text(
                    "Coupon Applied",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                ],
              ),
              Image.asset("assets/icons/delete.png")
            ],
          ),
        ),
      ],
    );
  }
}
