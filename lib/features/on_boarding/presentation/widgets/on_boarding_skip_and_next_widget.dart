
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';

import '../../../../core/utils/app_colors.dart';

class OnBoardingSkipAndNextWidget extends HookWidget {
  final ValueNotifier<int> index;
  const OnBoardingSkipAndNextWidget(
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          // onTap: () => context.navigateTo(
          //   const OurServiceView(),
          // ),
          child: const Text(
            'Skip',
            style: TextStyles.darkGrey14Regular,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index.value < 2) {
              index.value = index.value + 1;
            } else {
              // context.navigateTo(
              //   const OurServiceView(),
              // );
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: 48,
            width: 48,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.primaryColor),
            child: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
