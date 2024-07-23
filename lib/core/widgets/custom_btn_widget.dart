import 'package:flutter/material.dart';

class CustomBtnWidget extends StatelessWidget {
  final Color color;
  final String text;
  final TextStyle titleStyle;
  final Function()? onTap;
  const CustomBtnWidget({
    super.key,
    required this.color,
    required this.text,
    required this.titleStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap != null ? onTap!() : () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 36,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: Text(
          text,
          style: titleStyle,
        ),
      ),
    );
  }
}
