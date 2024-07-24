import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      height: 30,
      width: 90,
      decoration: BoxDecoration(
        color: const Color(0xffFFD5D3),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 19,
            width: 19,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset("assets/icons/add.png" , color: AppColors.primaryColor,),
          ),
          const Text("Add New" , style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor
          ),)
        ],
      ),
    );
  }
}
