import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class PriceDetailsRow extends StatelessWidget {
  PriceDetailsRow({super.key, required this.title, required this.price , this.isTotal= false});
  final String title;
  final String price;
  bool isTotal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isTotal?const EdgeInsets.only(top: 16):const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title , style: TextStyles.black16SemiBold,),
          RichText(text: TextSpan(text: price, style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isTotal?AppColors.primaryColor:AppColors.darkGreyColor
          ), children: [
            TextSpan(
              text: " SAR",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: isTotal?AppColors.primaryColor:AppColors.greyColor,
              ),
            )
          ]))

        ],
      ),
    );
  }
}
