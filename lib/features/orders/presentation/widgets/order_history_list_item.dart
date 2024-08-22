import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';
import 'package:single_resturant_app/features/orders/data/models/my_order_model.dart';
import 'package:single_resturant_app/features/orders/presentation/widgets/order_status_widget_builder.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';

class OrderHistoryListItem extends StatelessWidget {
  final MyOrderModel orderModel;
  const OrderHistoryListItem({
    super.key,
    required this.orderModel,
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
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImageWidget(
                url: orderModel.orderItems.first.image ?? '',
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
                Text(
                  orderModel.orderItems.first.name ?? '',
                  style: TextStyles.black18SemiBold,
                ),
                const OrderStatusWidgetBuilder(
                  orderStatus: OrderStatusEnum.canceled,
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
                    Text(
                      '# ${orderModel.id}',
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
                    Text(
                      DateFormat('dd-M-yyyy').format(
                        DateTime.parse(
                          orderModel.date,
                        ),
                      ),
                      style: TextStyles.darkGrey10Regular,
                    ),
                  ],
                ),
                const Gap(8),
                RichText(
                  text: TextSpan(
                    text: orderModel.orderItems.length.toString(),
                    style: TextStyles.primary14Medium,
                    children: const [
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
