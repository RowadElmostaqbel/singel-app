import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../../../../core/utils/text_styles.dart';

class OrderProgressBottomSheet extends StatelessWidget {
  static List<Map<String, dynamic>> steps = [
    {
      'title': 'Pending',
      'icon': Assets.assetsIconsPendingIc,
      'status': 'Done',
      'time': '9:00 AM',
    },
    {
      'title': 'Preparing',
      'icon': Assets.assetsIconsPreparingIc,
      'status': 'Done',
      'time': '9:10 AM',
    },
    {
      'title': 'In Shipping',
      'icon': Assets.assetsIconsShippingIc,
      'status': 'In Progress',
      'time': '9:14 AM',
    },
  ];
  const OrderProgressBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 32,
      ),
      width: context.width,
      height: context.height * .4,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EasyStepper(
              showScrollbar: false,
              showTitle: false,
              enableStepTapping: false,
              showLoadingAnimation: false,
              disableScroll: true,
              lineStyle: const LineStyle(
                lineLength: 50,
                finishedLineColor: AppColors.primaryColor,
                lineThickness: 1.3,
              ),
              alignment: AlignmentDirectional.topCenter,
              direction: Axis.vertical,
              activeStep: 2,
              steps: steps
                  .map(
                    (step) => EasyStep(
                      customStep: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(step['icon']),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: steps
                      .map(
                        (step) => Container(
                          margin: const EdgeInsets.only(bottom: 65),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      step['title'],
                                      style: TextStyles.black16SemiBold,
                                    ),
                                    Text(
                                      step['status'],
                                      style: TextStyles.black16SemiBold,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                step['time'],
                                style: TextStyles.darkGrey14SemiBold,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
