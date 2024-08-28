
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class PriceRangeSlider extends HookWidget {
  const PriceRangeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<RangeValues> range = useState(const RangeValues(20, 70));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Price Range', style: TextStyles.black16SemiBold),
        const Gap(15),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 8,
            overlayShape: SliderComponentShape.noOverlay,
            valueIndicatorColor: Colors.transparent,
            valueIndicatorTextStyle: TextStyles.grey14Regular,
          ),
          child: RangeSlider(
            min: 0.0,
            max: 100.0,
            divisions: 100,
            inactiveColor: const Color(0xffF4F4F4),
            activeColor: AppColors.primaryColor,
            labels: RangeLabels(
              '\$ ${range.value.start.round()}',
              '\$ ${range.value.end.round()}',
            ),
            values: range.value,
            onChanged: (values) {
              range.value = RangeValues(values.start, values.end);
            },
          ),
        ),
      ],
    );
  }
}
