import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/features/review/presentation/controllers/review_cubit.dart';
import 'package:single_resturant_app/features/review/presentation/widgets/add_review_btn.dart';
import 'package:single_resturant_app/features/review/presentation/widgets/review_rating_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class AddReviewDialog extends HookWidget {
  const AddReviewDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<ReviewCubit>().clearDataModel();
      return null;
    }, []);
    return BlocConsumer<ReviewCubit, ReviewState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Review',
                  style: TextStyles.black18SemiBold,
                ),
                AddReviewBtn(),
              ],
            ),
            const Gap(16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1,
                  color: AppColors.greyColor.withOpacity(.6),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Rating',
                        style: TextStyles.black16Medium,
                      ),
                      ReviewRatingWidget(),
                    ],
                  ),
                  const Gap(16),
                  const Text(
                    'Add Comment',
                    style: TextStyles.black16Medium,
                  ),
                  const Gap(6),
                  Container(
                    height: 76,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: AppColors.greyColor.withOpacity(
                          .6,
                        ),
                      ),
                    ),
                    child: TextField(
                      cursorHeight: 16,
                      onChanged: (value) {
                        context
                            .read<ReviewCubit>()
                            .addToDataModel(comment: value);
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 16),
                        border: InputBorder.none,
                        hintText: 'Write your comment here',
                        hintStyle: TextStyles.brightBlack14SemiMedium,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Gap(16),
          ],
        );
      },
    );
  }
}
