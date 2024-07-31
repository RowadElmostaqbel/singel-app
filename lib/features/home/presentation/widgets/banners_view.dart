import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../../../../core/utils/assets.dart';

class BannersView extends StatelessWidget {
  const BannersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 4,
      itemBuilder: (context, index, ind) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          Assets.assetsImagesBanner,
          fit: BoxFit.fitWidth,
        ),
      ),
      options: CarouselOptions(
        autoPlay: true,
        height: 180,
        viewportFraction: 1,
      ),
    );
  }
}
