import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomPhotoContainer extends StatelessWidget {
  const CustomPhotoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
                color: Color(0xffE9E9E9),
                shape: BoxShape.circle
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset("assets/images/person.png")),
          ),
        ),
        Positioned(
          right: 100,
          top: 110,
          child: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
            ),
            child: Image.asset("assets/icons/camera.png"),
          ),
        )
      ],
    );
  }
}
