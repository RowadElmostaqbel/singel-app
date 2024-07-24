import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

class VisaBanners extends StatelessWidget {
  const VisaBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: CarouselSlider.builder(
        itemCount: 3,
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
            "assets/images/credit_card.png",
            fit: BoxFit.fill,
          ),
        ),
        options: CarouselOptions(
          autoPlay: false,
          height: 180,
          viewportFraction: 0.85,
        ),
      ),
    );
  }
}
