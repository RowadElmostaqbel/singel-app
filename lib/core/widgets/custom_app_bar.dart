import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../utils/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final TextStyle? style;
  const CustomAppBar({
    super.key,
    required this.title,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: context.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                alignment: Alignment.center,
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 15,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: style ?? TextStyles.black16SemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
