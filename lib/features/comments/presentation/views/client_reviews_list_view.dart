import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/custom_toast_widget.dart';
import 'package:single_resturant_app/features/comments/presentation/views/all_reivew_view.dart';
import 'package:single_resturant_app/features/comments/widgets/client_review_list_item.dart';
import 'package:single_resturant_app/features/review/data/models/review_model.dart';
import 'package:single_resturant_app/features/review/presentation/controllers/review_cubit.dart';
import 'package:single_resturant_app/features/review/presentation/widgets/add_review_dialog.dart';
import 'package:single_resturant_app/features/review/presentation/widgets/add_review_widget.dart';

import '../../../../core/utils/text_styles.dart';

class ClientReviewsListView extends HookWidget {
  final int itemId;
  final bool isOrdered;
  const ClientReviewsListView({super.key, required this.itemId,required this.isOrdered,});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<ReviewCubit>().fetchItemReviews(itemId);
      return null;
    });

    return SliverToBoxAdapter(
      child: BlocConsumer<ReviewCubit, ReviewState>(
        listener: (context, state) {
          if (state is FetchReviewsFailureState) {
            showTaost(
              state.failure.msg,
              AppColors.primaryColor,
            );
          }
        },
        builder: (context, state) {
          List<ReviewModel> itemReviews =
              context.read<ReviewCubit>().itemReviews[itemId.toString()] ?? [];
          if (itemReviews.isNotEmpty) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Client’s Review',
                      style: TextStyles.black18SemiBold,
                    ),
                    if(isOrdered)
                    GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          content: AddReviewDialog(),
                        ),
                      ),
                      child: const Text(
                        'Add Review',
                        style: TextStyles.primary16Medium,
                      ),
                    ),
                  ],
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ClientReviewListItem(
                    reviewModel: itemReviews[index],
                  ),
                  separatorBuilder: (context, index) => const Gap(16),
                  itemCount: itemReviews.length,
                ),
              ],
            );
          } else if (state is FetchReviewsLoadingState && itemReviews.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
