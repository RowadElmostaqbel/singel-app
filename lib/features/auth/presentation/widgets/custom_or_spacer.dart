import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CustomOrSpacer extends StatelessWidget {
  const CustomOrSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 1,
            width: MediaQuery.sizeOf(context).width / 4.5,
            decoration: const BoxDecoration(
              color: AppColors.greyColor,
            ),
          ),
          const Text(
            "or continue with",
            style: TextStyles.grey16Medium,
          ),
          Container(
            height: 1,
            width: MediaQuery.sizeOf(context).width / 4.5,
            decoration: const BoxDecoration(
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
