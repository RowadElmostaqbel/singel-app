import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../utils/text_styles.dart';

class CustomDropDownButtonFormField extends StatefulWidget {
  const CustomDropDownButtonFormField(
      {super.key, required this.dropDownList, required this.label, required this.icon});

  final String label;
  final String icon;
  final List<String> dropDownList;

  @override
  State<CustomDropDownButtonFormField> createState() =>
      _CustomDropDownButtonFormFieldState();
}

class _CustomDropDownButtonFormFieldState
    extends State<CustomDropDownButtonFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: SizedBox(
        height: 78,
        child: Stack(
          children: [
            DropdownButtonFormField(
              decoration: InputDecoration(
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
              value: widget.dropDownList.first,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.greyColor,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 30,
                color: AppColors.primaryColor,
              ),
              iconSize: 24,
              onChanged: (String? newValue) {
                setState(() {
                  widget.dropDownList.first = newValue!;
                });
              },
              items: widget.dropDownList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Align(
              alignment: const Alignment(0, -1.9),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                color: Colors.white,
                child: Row(
                  children: [
                    Image.asset(widget.icon),
                    const SizedBox(width: 4,),
                    Text(widget.label, style: TextStyles.black14Bold),
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
