
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/notifications/presentation/widgets/notification_items_list_view.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              right: 0,
              left: 0,
              child: SizedBox(
                height: context.height,
                width: context.width,
                child: Image.asset(
                  Assets.assetsImagesProfileBackground,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: context.height * .85,
                width: context.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: const NotificationItemsListView(),
              ),
            ),
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 28,
                ),
                child: CustomAppBar(
                  title: 'Notifications',
                  style: TextStyles.white18SemiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
