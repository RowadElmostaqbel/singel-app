import 'package:flutter/material.dart';

class CustomSpacer extends StatelessWidget {
  const CustomSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 1,
      color: const Color(0xffE0E0E0),
    );
  }
}
