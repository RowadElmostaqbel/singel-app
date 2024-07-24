import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomOnButton extends StatefulWidget {
  const CustomOnButton({super.key});

  @override
  State<CustomOnButton> createState() => _CustomOnButtonState();
}
bool isTurnOn = false;
class _CustomOnButtonState extends State<CustomOnButton> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        setState(() {
          isTurnOn = !isTurnOn;
        });
      },
      child: Stack(children: [
        Container(
          height: 12,
          width: 22,
          decoration: BoxDecoration(
            color: isTurnOn
                ? AppColors.primaryColor
                : AppColors.greyColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Align(
            alignment: isTurnOn
                ? const Alignment(1, 0)
                : const Alignment(-1, 0),
            child: Container(
              height: 10,
              width: 10,
              margin: const EdgeInsets.all(1),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
          ),
        ),
      ]),
    );
  }
}
