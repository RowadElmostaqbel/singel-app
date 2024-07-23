import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/app_colors.dart';

class CustomRatingWidget extends StatelessWidget {
  const CustomRatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      itemSize: 15,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(
        horizontal: 1.0,
        vertical: 10.0,
      ),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: AppColors.yellowColor,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
