
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/features/notifications/presentation/widgets/notification_list_item.dart';

import '../../../../core/utils/assets.dart';

class NotificationItemsListView extends StatelessWidget {
  const NotificationItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 32,
      ),
      itemBuilder: (context, index) => Dismissible(
        direction:
            DismissDirection.endToStart, // Allows swipe from left to right only

        background: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.redAccent.withOpacity(.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: 36,
            width: 36,
            child: Image.asset(Assets.assetsIconsTrash),
          ),
        ),
        key: Key(index.toString()),
        child: const NotificationListItem(),
      ),
      separatorBuilder: (context, index) => const Gap(16),
      itemCount: 5,
    );
  }
}
