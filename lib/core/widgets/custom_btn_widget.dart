import 'package:flutter/material.dart';

class CustomBtnWidget extends StatelessWidget {
  final Color color;
  final String text;
  final TextStyle titleStyle;

  final Function()? onTap;
  final double? radius;
  final Border? border;
  const CustomBtnWidget({
    super.key,
    required this.color,
    required this.text,
    required this.titleStyle,
    this.onTap,
    this.radius,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap != null ? onTap!() : () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 50),
          color: color,
          border: border,
        ),
        child: Text(
          text,
          style: titleStyle,
        ),
      ),
    );
  }
}
