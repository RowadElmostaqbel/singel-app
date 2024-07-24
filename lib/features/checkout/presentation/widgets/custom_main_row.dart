import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';
import 'custom_add_button.dart';

class CustomMainRow extends StatelessWidget {
  const CustomMainRow({super.key, required this.title, required this.onTap});
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title , style: TextStyles.black16SemiBold,),
        InkWell(
            onTap: onTap,
            child: const CustomAddButton())
      ],
    );
  }
}
