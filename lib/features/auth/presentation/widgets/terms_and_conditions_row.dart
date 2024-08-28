import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class TermsAndConditionsRow extends StatefulWidget {
  const TermsAndConditionsRow({super.key});

  @override
  State<TermsAndConditionsRow> createState() => _TermsAndConditionsRowState();
}
bool isChecked = false;
class _TermsAndConditionsRowState extends State<TermsAndConditionsRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            side: const BorderSide(
              color: Color(0xffB7B7B7),
            ),
            activeColor: const Color(0xffB7B7B7),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            }),
        RichText(
            text: const TextSpan(
                text: "By Clicking, you agree to ",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: "Terms & Conditions",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                      fontSize: 14,
                    ),
                  )
                ])),
      ],
    );
  }
}
