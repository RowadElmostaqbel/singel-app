import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/text_styles.dart';
import '../../data/models/my_order_model.dart';

class OrderDeliveryDetails extends StatelessWidget {
  const OrderDeliveryDetails({
    super.key,
    required this.orderModel,
  });

  final MyOrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Address Name: ${orderModel.address.name}",
                    style: TextStyles.black14Regular),
                Text("City: ${orderModel.address.cityName}",
                    style: TextStyles.black14Regular),
              ],
            ),
            const Gap(4),
            const Text("Address Description:",
                style: TextStyles.black14Regular),
            const Gap(4),
            Text("${orderModel.address.details}",
                style: TextStyles.darkGrey14Regular),
            const Gap(8),
            GestureDetector(
              onTap: () async => await launchUrl(
                Uri.parse(
                  'https://www.google.com/maps/search/?api=1&query=${orderModel.address.latitude},${orderModel.address.longitude}',
                ),
              ),
              child: Image.asset(
                "assets/images/map_location.png",
                width: context.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
