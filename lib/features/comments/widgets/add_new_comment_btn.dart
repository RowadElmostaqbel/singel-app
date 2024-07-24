import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/text_styles.dart';

class AddNewCommentBtn extends StatelessWidget {
  const AddNewCommentBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                           
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const FittedBox(
                child: Icon(
                  Icons.add,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const Gap(8),
            const Text(
              'Add New',
              style: TextStyles.primary14Regular,
            ),
          ],
        ),
      ),
    );
  }
}
