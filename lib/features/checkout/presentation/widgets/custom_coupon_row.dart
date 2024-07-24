import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomCouponRow extends StatelessWidget {
  const CustomCouponRow({super.key});

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
        const SizedBox(width: 10,),
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
