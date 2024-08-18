import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/features/comments/widgets/client_review_list_item.dart';


class ClientReviewsListView extends StatelessWidget {
  const ClientReviewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => const ClientReviewListItem(),
      separatorBuilder: (context, index) => const Gap(16),
      itemCount: 3,
    );
  }
}

