import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/features/auth/presentation/widgets/custom_country_picker_widget.dart';

import '../../../../core/utils/text_styles.dart';

class CustomPhoneTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  bool obscureText;
  final String label;
  final String hintText;
  final String icon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool fromRegister;
  CustomPhoneTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    required this.keyboardType,
    required this.validator,
    required this.icon,
    required this.onChanged,
    required this.fromRegister,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: SizedBox(
        height: 78,
        child: Stack(
          children: [
            Row(
              children: [
                 Expanded(
                  child: CustomCountryPickerWidget(
                    fromRegister: fromRegister,
                  ),
                ),
                const Gap(8),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    onChanged: onChanged,
                    keyboardType: keyboardType,
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
                ),
              ],
            ),
            Align(
              alignment: const Alignment(0, -1.9),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                color: Colors.white,
                child: Row(
                  children: [
                    Image.asset(icon),
                    const SizedBox(
                      width: 4,
                    ),
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
