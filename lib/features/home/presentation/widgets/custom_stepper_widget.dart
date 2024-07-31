
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CustomStepperWidget extends StatelessWidget {
  final ValueNotifier<bool> isResturentSelected;
  final PageController pageController;

  const CustomStepperWidget({
    super.key,
    required this.isResturentSelected,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    if (isResturentSelected.value) {
      pageController.jumpToPage(1);
    }
    return EasyStepper(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      activeStep: 0,
      showLoadingAnimation: false,
      enableStepTapping: false,
      lineStyle: LineStyle(
        lineType: LineType.dashed,
        lineLength: context.width * .625,
      ),
      stepRadius: 20,
      showStepBorder: false,
      steps: [
        EasyStep(
          customStep: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primaryColor,
            child: isResturentSelected.value
                ? const FittedBox(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    '1',
                    style: TextStyles.white18SemiBold,
                  ),
          ),
        ),
        EasyStep(
          customStep: Container(
            alignment: Alignment.center,
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff212227),
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ]),
            child: const Text(
              '2',
              style: TextStyles.primary18SemiBold,
            ),
          ),
        ),
      ],
    );
  }
}
