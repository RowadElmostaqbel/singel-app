import 'package:flutter/material.dart';

class CustomTopBackground extends StatelessWidget {
  const CustomTopBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Image.asset(
          "assets/images/background.png",
          opacity: const AlwaysStoppedAnimation(.05),
        ));
  }
}
