import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    required this.keyboardType,
    required this.validator, required this.icon,
  });

  final TextEditingController? controller;
  bool obscureText;
  final String label;
  final String hintText;
  final String icon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: SizedBox(
        height: 78,
        child: Stack(
          children: [
            TextFormField(
              keyboardType:keyboardType,
              validator: validator,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyles.grey14Regular,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: Color(0xffE9E9E9),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: Color(0xffE9E9E9),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                    color: Color(0xffE9E9E9),
                    width: 1.5,
                  ),
                ),
              ),
              controller: controller,
            ),
            Align(
              alignment: const Alignment(0, -1.9),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                color: Colors.white,
                child: Row(
                  children: [
                    Image.asset(icon),
                    const SizedBox(width: 4,),
                    Text(label, style: TextStyles.black14Bold),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
