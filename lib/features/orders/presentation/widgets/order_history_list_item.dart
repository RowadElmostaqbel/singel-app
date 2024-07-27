import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/features/orders/presentation/widgets/order_status_widget_builder.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';

class OrderHistoryListItem extends StatelessWidget {
  const OrderHistoryListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 17,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 120,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                Assets.assetsImagesBurgerjfif,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Gap(8),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Beef Burger',
                  style: TextStyles.black18SemiBold,
                ),
                const OrderStatusWidgetBuilder(
                  orderStatus: OrderStatusEnum.active,
                  showConatiner: false,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: Image.asset(
                        Assets.assetsIconsTaskIc,
                      ),
                    ),
                    const Gap(6),
                    const Text(
                      '#21269',
                      style: TextStyles.darkGrey10Regular,
                    ),
                  ],
                ),
                const Gap(8),
                Row(
                  children: [
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: Image.asset(
                        Assets.assetsIconsCalendarIc,
                      ),
                    ),
                    const Gap(6),
                    const Text(
                      'Apr 10- 9:30 AM',
                      style: TextStyles.darkGrey10Regular,
                    ),
                  ],
                ),
                const Gap(8),
                RichText(
                  text: const TextSpan(
                    text: '2',
                    style: TextStyles.primary14Medium,
                    children: [
                      TextSpan(
                        text: ' Items',
                        style: TextStyles.darkGrey14Regular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
