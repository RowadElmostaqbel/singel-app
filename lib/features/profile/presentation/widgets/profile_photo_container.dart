import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class ProfilePhotoContainer extends StatelessWidget {
  const ProfilePhotoContainer({super.key, required this.onPressedGallery, required this.onPressedCamera});
  final void Function() onPressedGallery;
  final void Function() onPressedCamera;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              )),
        ),
        Align(
          alignment: const Alignment(0,1.1),
          child: Container(
            padding: const EdgeInsets.all(5),
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset("assets/images/person.png")),
          ),
        ),
        Align(
          alignment: const Alignment(0.3, 1),
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
                  shape: BoxShape.circle,
                  color: Colors.white
              ),
              child: Image.asset("assets/icons/camera.png" , color: AppColors.primaryColor,),
            ),
          ),
        )
      ],
    );
  }
}
