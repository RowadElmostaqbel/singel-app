
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class DeliveryDistanceSliderWidget extends HookWidget {
  const DeliveryDistanceSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<double>sliderValue=useState(0.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Delivery Distance',
        style: TextStyles.black16SemiBold),
    const Gap(12),
     Text('${sliderValue.value.toInt()} Km', style: TextStyles.black16SemiBold),
    const Gap(15),
    SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 8,
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: Slider(
        min: 0.0,
        max: 100.0,
        inactiveColor: const Color(0xffF4F4F4),
        activeColor: AppColors.primaryColor,
        value: sliderValue.value,
        onChanged: (value) {
          sliderValue.value=value;
        },
      ),
    ),
      ],
    );
  }
}