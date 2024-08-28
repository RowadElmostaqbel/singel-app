import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_resturant_app/core/widgets/custom_toast_widget.dart';
import 'package:single_resturant_app/features/review/presentation/controllers/review_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class AddReviewBtn extends StatelessWidget {
  const AddReviewBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewCubit, ReviewState>(
      listener: (context, state) {
        if (state is ReviewAddedState) {
          showTaost('Review Added', AppColors.primaryColor);
        } else if (state is ReviewFailureState) {
          showTaost(state.failure.msg, AppColors.primaryColor);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<ReviewCubit>().addReview(),
          child: Container(
            height: 40,
            constraints: const BoxConstraints(
              maxWidth: 120,
            ),
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: AppColors.primaryColor,
              ),
            ),
            child: state is ReviewLoadingState
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    'Add Review',
                    style: TextStyles.primary16Medium,
                  ),
          ),
        );
      },
    );
  }
}
