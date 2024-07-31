import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/text_styles.dart';

class CardTextFormFiled extends StatelessWidget {
  CardTextFormFiled({
    super.key,
    required this.keyboardType,
    required this.validator,
    required this.hintText,
    required this.controller,
    required this.label,
    this.isHaveSize = false,
    required this.onChanged, required this.inputFormatters,
  });

  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String hintText;
  final String label;
  final TextEditingController? controller;
  bool isHaveSize;
  final void Function(String)? onChanged;
  final List<TextInputFormatter> inputFormatters;

@override
  Widget build(BuildContext context) {
    return Padding(
      padding: isHaveSize
          ? EdgeInsets.zero
          : const EdgeInsets.only(left: 24, right: 24, top: 16),
      child: SizedBox(
        height: 78,
        child: Stack(
          children: [
            TextFormField(
              inputFormatters: inputFormatters,
              onChanged: onChanged,
              keyboardType: keyboardType,
              validator: validator,
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
              alignment: const Alignment(-1, -1.8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                color: Colors.white,
                child: Text(label, style: TextStyles.black14Bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
