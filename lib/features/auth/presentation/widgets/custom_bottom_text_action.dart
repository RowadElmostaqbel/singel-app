import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomBottomTextAction extends StatelessWidget {
  const CustomBottomTextAction({super.key, required this.onTap, required this.textOne, required this.textTwo, required this.textOneColor});
  final void Function()? onTap;
  final String textOne;
  final Color textOneColor;
  final String textTwo;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: RichText(
            text:  TextSpan(
                text: textOne,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                  color:textOneColor,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: textTwo,
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                      fontSize: 16,
                    ),
                  )
                ])),
      ),
    );
  }
}
