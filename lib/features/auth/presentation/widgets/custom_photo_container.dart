import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomPhotoContainer extends StatelessWidget {
  const CustomPhotoContainer(
      {super.key,
      required this.onPressedGallery,
      required this.onPressedCamera,
      required this.mainImage});

  final void Function() onPressedGallery;
  final void Function() onPressedCamera;
  final Widget mainImage;

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
                color: Color(0xffE9E9E9), shape: BoxShape.circle),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(80), child: mainImage),
          ),
        ),
        Positioned(
          right: 100,
          top: 110,
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      insetPadding: EdgeInsets.zero,
                      content: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.12,
                        child: Column(
                          children: [
                            TextButton(
                                onPressed: onPressedGallery,
                                child: const Text('Choose form Gallery')),
                            TextButton(
                                onPressed: onPressedCamera,
                                child: const Text('Open Camera'))
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: Image.asset("assets/icons/camera.png"),
            ),
          ),
        )
      ],
    );
  }
}
