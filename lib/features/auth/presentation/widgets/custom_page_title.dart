import 'package:flutter/material.dart';

class CustomPageTitle extends StatelessWidget {
  const CustomPageTitle({super.key, required this.title});
  final String title ;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(0,8,0,32),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
