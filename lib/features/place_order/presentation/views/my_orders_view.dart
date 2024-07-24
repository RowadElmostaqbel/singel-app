

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../home/presentation/views/category_view.dart';
import 'upcoming_order_view.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        height: context.height * .85,
        width: context.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTabBar(
              PageController(),
              titles: const [
                'Upcoming',
                'History',
              ],
            ),
            const Gap(14),
            const Expanded(
              child: UpcomingOrdersView(),
            )
          ],
        ),
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            Positioned(
              top: -10,
              child: SizedBox(
                height: context.height * .3,
                width: context.width,
                child: Image.asset(
                  Assets.assetsImagesProfileBackground,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: CustomAppBar(
                  title: 'My Orders',
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

