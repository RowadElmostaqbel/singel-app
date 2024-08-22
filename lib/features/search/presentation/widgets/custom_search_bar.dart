import 'dart:developer';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  Color iconColor = const Color(0xff9899A7);
  Color textColor = const Color(0xff9899A7);
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.brightGreyColor,
      ),
      child: TextFormField(
          controller: search,
          onChanged: (value) {
            EasyDebounce.debounce(
              'my-debouncer', // <-- An ID for this particular debouncer
              const Duration(milliseconds: 500), // <-- The debounce duration
              () => log(name: 'debounce', value), // <-- The target method
            );
          },
          onEditingComplete: () {
            setState(() {
              FocusScope.of(context).unfocus();
              iconColor = const Color(0xff9899A7);
              textColor = const Color(0xff9899A7);
            });
          },
          onTapOutside: (event) {
            setState(() {
              FocusScope.of(context).unfocus();
              iconColor = const Color(0xff9899A7);
              textColor = const Color(0xff9899A7);
            });
          },
          onTap: () {
            setState(() {
              iconColor = AppColors.primaryColor;
              textColor = AppColors.primaryColor;
            });
          },
          decoration: InputDecoration(
            fillColor: AppColors.brightGreyColor,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.primaryColor,
                )),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 20,
                width: 20,
                child: Image.asset(
                  Assets.assetsIconsSearch,
                  color: iconColor,
                ),
              ),
            ),
            hintText: 'Search food ...',
            hintStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          )),
    );
  }
}
