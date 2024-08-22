import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/features/checkout/presentation/widgets/selected_time_dialog.dart';

import '../../../../core/utils/app_colors.dart';

class TimeOptionsContainer extends HookWidget {
  const TimeOptionsContainer({super.key, this.isChecked = false});

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    List<String> paymentMethods = [
      "Now",
      "Selected Time",
    ];
    String iconsPath = "assets/icons/";
    List<String> paymentIcons = [
      ("${iconsPath}clock.png"),
      ("${iconsPath}calendar.png"),
    ];
    List dialogs = [const SelectedTimeDialog()];
    ValueNotifier<String> groupValue = useState(paymentMethods.first);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: paymentMethods.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xffF4F4F4))),
              child: RadioListTile<String>(
                activeColor: AppColors.primaryColor,
                value: paymentMethods[index],
                groupValue: groupValue.value,
                onChanged: (val) {
                  groupValue.value = val!;
                  if (index == 1) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return dialogs[0];
                      },
                    );
                  }
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      paymentMethods[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff5C5C5C),
                      ),
                    ),
                    Image.asset(paymentIcons[index])
                  ],
                ),
              ),
            );
          }),
    );
  }
}
