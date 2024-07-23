import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
              boxShadow: [BoxShadow(
                  blurRadius: 4,
                  color: AppColors.greyColor

              )],
              color: Colors.white,
              shape: BoxShape.circle
          ),
          child: Image.asset("assets/images/facebook.png" , scale: 0.8,),
        ),
        SizedBox(width: MediaQuery.sizeOf(context).width*0.05,),
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
              boxShadow: [BoxShadow(
                  blurRadius: 4,
                  color: AppColors.greyColor

              )],
              color: Colors.white,
              shape: BoxShape.circle
          ),
          child: Image.asset("assets/images/google_icon.png", scale: 1.7,),
        ),
      ],
    );
  }
}
