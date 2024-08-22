import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/widgets/custom_app_bar.dart';
import 'package:single_resturant_app/features/review/data/models/review_model.dart';

import '../../widgets/client_review_list_item.dart';

class AllReivewView extends StatelessWidget {
  final List<ReviewModel> reviews;
  const AllReivewView({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const CustomAppBar(title: 'Item Reviews'),
              const Gap(16),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shrinkWrap: true,
                itemBuilder: (context, index) =>  ClientReviewListItem(
                  reviewModel: reviews[index],
                ),
                separatorBuilder: (context, index) => const Gap(16),
                itemCount: reviews.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
