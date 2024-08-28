

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_btn_widget.dart';

class ApplyAndCancelFilterButtons extends StatelessWidget {
  const ApplyAndCancelFilterButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 14,
      ),
      height: 80,
      child: Row(
        children: [
          const Expanded(
            child: CustomBtnWidget(
              color: Color(0xffF4F4F4),
              text: 'Cancel',
              titleStyle: TextStyles.black16SemiBold,
            ),
          ),
          Expanded(
            child: CustomBtnWidget(
              color: AppColors.primaryColor,
              text: 'Apply Now',
              titleStyle: TextStyles.white32SemiBold.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
