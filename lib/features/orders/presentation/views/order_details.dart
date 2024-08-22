import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';
import 'package:single_resturant_app/core/widgets/custom_app_bar.dart';
import 'package:single_resturant_app/features/orders/data/models/my_order_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';

class OrderDetails extends StatelessWidget {
  final MyOrderModel orderModel;
  const OrderDetails({
    super.key,
    required this.orderModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomAppBar(title: "Order Details"),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 50.0, bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Order Information",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "Order",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                      children: [
                                        const TextSpan(
                                          text: "#",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "${orderModel.id}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                      ]),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
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
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset(
                                              Assets.assetsIconsTimeIc),
                                        ),
                                        const Gap(8),
                                        const Text(
                                          'Order Date',
                                          style: TextStyles
                                              .brightBlack14SemiMedium,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      DateFormat('dd-M-yyyy').format(
                                        DateTime.parse(
                                          orderModel.date,
                                        ),
                                      ),
                                      style: TextStyles.black16Medium,
                                    ),
                                  ],
                                ),
                                const Gap(12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset(
                                              Assets.assetsIconsDollar),
                                        ),
                                        const Gap(8),
                                        const Text(
                                          'Order Status',
                                          style: TextStyles
                                              .brightBlack14SemiMedium,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      orderModel.orderStatus,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                const Gap(12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset(
                                              Assets.assetsIconsCandle),
                                        ),
                                        const Gap(8),
                                        const Text(
                                          'Order Type',
                                          style: TextStyles
                                              .brightBlack14SemiMedium,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      orderModel.orderType,
                                      style: TextStyles.primary12SemiBold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Gap(16),
                          const Text(
                            "Meal Information",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const Gap(16),
                          OrderItemsListView(orderModel: orderModel),
                          const Padding(
                            padding: EdgeInsets.only(top: 12.0, bottom: 12),
                            child: Text(
                              "Delivery Address",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ),
                          OrderDeliveryDetails(orderModel: orderModel),
                          const Gap(24),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class OrderItemsListView extends StatelessWidget {
  const OrderItemsListView({
    super.key,
    required this.orderModel,
  });

  final MyOrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => OrderMealsListItem(
        orderItemModel: orderModel.orderItems[index],
      ),
      separatorBuilder: (context, index) => const Gap(14),
      itemCount: orderModel.orderItems.length,
    );
  }
}

class OrderMealsListItem extends StatelessWidget {
  final OrderItemModel orderItemModel;
  const OrderMealsListItem({
    super.key,
    required this.orderItemModel,
  });

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
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: CachedNetworkImageWidget(
              url: orderItemModel.image ?? '',
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Order Name:",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: Colors.black),
                              children: [
                            TextSpan(
                              text: orderItemModel.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black),
                            )
                          ])),
                      RichText(
                        text: TextSpan(
                          text: orderItemModel.price.toString(),
                          style: TextStyles.black16SemiBold,
                          children: const [
                            TextSpan(
                              text: ' SAR',
                              style: TextStyles.primary14Medium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(4),
                  RichText(
                      text: TextSpan(
                          text: "Quantity:",
                          style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: Colors.black),
                          children: [
                        TextSpan(
                          text: orderItemModel.quantity.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black),
                        )
                      ])),
                  const Gap(4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chicken Burger",
                        style: TextStyles.black14Regular,
                      ),
                      Text(
                        "Burger",
                        style: TextStyles.black14Regular,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
