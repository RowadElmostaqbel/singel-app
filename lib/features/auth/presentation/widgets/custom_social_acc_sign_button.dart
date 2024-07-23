import 'package:flutter/material.dart';

class CustomSocialAccSignButton extends StatelessWidget {
  const CustomSocialAccSignButton(
      {super.key, required this.image, required this.title});

  final String image;

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.sizeOf(context).width,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: Colors.white),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                image,
                height: 32,
                width: 32,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
