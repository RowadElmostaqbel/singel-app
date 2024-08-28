import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';
import 'package:single_resturant_app/features/review/data/models/review_model.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/text_styles.dart';

class ClientReviewListItem extends StatelessWidget {
  final ReviewModel reviewModel;
  const ClientReviewListItem({
    super.key,
    required this.reviewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: CachedNetworkImageWidget(
                        url: reviewModel.image,
                        isProfileImage: true,
                      ),
                    ),
                    const Gap(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reviewModel.name,
                          style: TextStyles.black16SemiBold,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 15,
                              width: 15,
                              child: Image.asset(Assets.assetsIconsStar),
                            ),
                            Text(
                              reviewModel.rate.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                    DateFormat('dd-M-yyyy').format(
                      DateTime.parse(
                        reviewModel.createdAt,
                      ),
                    ),
                    style: TextStyles.darkGrey14SemiBold),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: context.width,
            height: 1,
            color: AppColors.greyColor.withOpacity(.6),
          ),
          Text(
            reviewModel.comment ?? '',
            style: TextStyles.darkGrey14SemiBold,
          ),
        ],
      ),
    );
  }
}
