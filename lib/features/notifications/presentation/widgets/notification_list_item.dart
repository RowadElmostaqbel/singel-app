
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.only(
        top: 18,
        left: 16,
        right: 8,
      ),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(
            0xffF3F3F3,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32,
            width: 32,
            child: Image.asset(
              Assets.assetsIconsNotificationBing,
            ),
          ),
          const Gap(12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('App Update', style: TextStyles.black16SemiBold),
              Text(
                '''new update out now! Discover improved
    productivity tools and more''',
                style: TextStyles.darkGrey14Regular,
              )
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff212227),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const Text(
              '1',
              style: TextStyles.darkGrey14Regular,
            ),
          ),
        ],
      ),
    );
  }
}
