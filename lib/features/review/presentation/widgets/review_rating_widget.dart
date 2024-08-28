import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/features/review/presentation/controllers/review_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class ReviewRatingWidget extends HookWidget {
  const ReviewRatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<double> rate = useState(0);
    return Row(
      children: [
        RatingBar.builder(
          allowHalfRating: true,
          itemSize: 30,
          glowColor: Colors.white,
          itemBuilder: (context, index) {
            return const Icon(
              Icons.star_rounded,
              color: AppColors.yellowColor,
            );
          },
          onRatingUpdate: (rating) {
            rate.value = rating;
            context.read<ReviewCubit>().addToDataModel( rate: rating);
          },
        ),
        const Gap(12),
        Text(rate.value.toString(), style: TextStyles.black16Medium),
      ],
    );
  }
}
