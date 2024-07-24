import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CustomAddressContainer extends StatelessWidget {
  const CustomAddressContainer({super.key, required this.containerBorderColor, required this.title});
  final Color containerBorderColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 16, 30),
      child: Container(
        padding: const EdgeInsets.all(12),
        //margin: const EdgeInsets.fromLTRB(0, 30, 16, 30),
        height: 82,
        width: 205,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: containerBorderColor,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(title , style: TextStyles.black14Regular,),
                    const SizedBox(width: 6,),
                    Image.asset("assets/icons/edit.png" , color: AppColors.primaryColor),
                  ],
                ),
                Image.asset("assets/icons/delete.png" , color: const Color(0xff5C5C5C),)
              ],
            ),
            Row(
              children: [
                Image.asset("assets/icons/call.png"),
                const SizedBox(width: 6,),
                const Text("+201112778914", style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff5C5C5C),
                ),),
              ],
            ),
            Row(
              children: [
                Image.asset("assets/icons/gray_location.png"),
                const SizedBox(width: 6,),
                const Text("52 Riverside St.Norcross", style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff5C5C5C),
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
