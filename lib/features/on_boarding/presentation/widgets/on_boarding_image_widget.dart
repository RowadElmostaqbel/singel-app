import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

class OnBoardingImageWidget extends HookWidget {
  final String image;
  const OnBoardingImageWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .8,
      height: context.height * .4,
      child: Image.asset(
        image,
        // height: context.height * .4,
        // width: context.width,
        fit: BoxFit.fill,
      ),
    );
  }
}
