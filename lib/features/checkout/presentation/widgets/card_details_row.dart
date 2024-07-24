import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CardDetailsRow extends StatelessWidget {
  const CardDetailsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 24),
      child: Row(
        children: [
          Container(
            height: 11,
            width: 11,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.greyColor,
                )),
          ),
          const SizedBox(
            width: 4,
          ),
          const Text(
            "Save Card Details",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black),
          )
        ],
      ),
    );
  }
}
