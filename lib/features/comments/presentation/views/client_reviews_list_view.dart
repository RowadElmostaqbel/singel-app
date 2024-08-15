import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/comments/widgets/client_review_list_item.dart';

import '../../../../core/utils/text_styles.dart';

class ClientReviewsListView extends StatelessWidget {
  const ClientReviewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => ClientReviewListItem(),
      separatorBuilder: (context, index) => const Gap(16),
      itemCount: 3,
    );
  }
}

