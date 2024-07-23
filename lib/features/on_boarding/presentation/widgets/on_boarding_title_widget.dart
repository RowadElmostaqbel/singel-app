import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';

class OnBoardingTitleWidget extends StatelessWidget {
  final String title;
  final String desc;
  const OnBoardingTitleWidget({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.black24SemiBold,
        ),
        Text(
          desc,
          style: TextStyles.darkGrey14Regular,
        ),
      ],
    );
  }
}