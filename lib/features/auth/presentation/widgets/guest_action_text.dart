import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class GuestActionText extends StatelessWidget {
  const GuestActionText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: RichText(text: const TextSpan(
          text: "Login ",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColor,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: "as guest",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 16,
              ),
            )
          ]
      ),

      ),
    );
  }
}
