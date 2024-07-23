import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomNavigatorButton extends StatelessWidget {
  const CustomNavigatorButton({super.key, required this.title, required this.onPressed});
  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        height: 56,
        width: MediaQuery.sizeOf(context).width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            onPressed: onPressed,
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 20,
              ),
            )),
      ),
    );
  }
}
