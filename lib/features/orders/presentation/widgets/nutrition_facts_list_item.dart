
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class NutritionFactsListItem extends StatelessWidget {
  const NutritionFactsListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.darkPrimaryColor,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(
                0xffF4F4F4,
              ).withOpacity(.4),
            ),
            child: const Text(
              '4.7',
              style: TextStyles.white16Medium,
            ),
          ),
          const Gap(1),
          const Text(
            'Carbo',
            style: TextStyles.white14Medium,
          ),
        ],
      ),
    );
  }
}
