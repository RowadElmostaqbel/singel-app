import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CancelOrderReasonRadioWidget extends HookWidget {
  static List<String> reasons = [
    'The order came to me after a long time',
    'Other',
  ];
  const CancelOrderReasonRadioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> selectedReason = useState(reasons[0]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: reasons
          .map(
            (reason) => Container(
              margin: const EdgeInsets.only(
                bottom: 12,
              ),
              child: RadioListTile(
                activeColor: AppColors.primaryColor,
                value: reason,
                groupValue: selectedReason.value,
                onChanged: (val) {
                  selectedReason.value = val!;
                },
                title: Text(
                  reason,
                  style: TextStyles.black14Regular,
                ),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          )
          .toList(),
    );
  }
}
