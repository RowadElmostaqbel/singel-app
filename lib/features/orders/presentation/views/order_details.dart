import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/custom_app_bar.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const CustomAppBar(title: "Order Details"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Order Information",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          RichText(
                            text: const TextSpan(
                                text: "Order",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: "#",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "1234",
                                    style: TextStyle(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Image.asset(Assets.assetsIconsTimeIc),
                                  ),
                                  const Gap(8),
                                  const Text(
                                    'Order Date',
                                    style: TextStyles.brightBlack14SemiMedium,
                                  ),
                                ],
                              ),
                              const Text(
                                '10-7-2024',
                                style: TextStyles.black16Medium,
                              ),
                            ],
                          ),
                          const Gap(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Image.asset(Assets.assetsIconsDollar),
                                  ),
                                  const Gap(8),
                                  const Text(
                                    'Total',
                                    style: TextStyles.brightBlack14SemiMedium,
                                  ),
                                ],
                              ),
                              const Text(
                                "Preparing",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const Gap(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Image.asset(Assets.assetsIconsCandle),
                                  ),
                                  const Gap(8),
                                  const Text(
                                    'Order Type',
                                    style: TextStyles.brightBlack14SemiMedium,
                                  ),
                                ],
                              ),
                              const Text(
                                'Delivery',
                                style: TextStyles.primary12SemiBold,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0, bottom: 12),
                      child: Text(
                        "Meal Information",
                        style:
                            TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
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
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
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
                                          text: const TextSpan(
                                              text: "Order Name:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 14,
                                                  color: Colors.black),
                                              children: [
                                            TextSpan(
                                              text: "Beef Burger",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            )
                                          ])),
                                      RichText(
                                        text: const TextSpan(
                                          text: '75',
                                          style: TextStyles.black16SemiBold,
                                          children: [
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
                                      text: const TextSpan(
                                          text: "Quantity:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14,
                                              color: Colors.black),
                                          children: [
                                        TextSpan(
                                          text: "2",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Colors.black),
                                        )
                                      ])),
                                  const Gap(4),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Chicken Burger",
                                          style: TextStyles.black14Regular),
                                      Text("Burger",
                                          style: TextStyles.black14Regular),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0, bottom: 12),
                      child: Text(
                        "Delivery Address",
                        style:
                            TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Address Name: Home",
                                    style: TextStyles.black14Regular),
                                Text("City: El Mansoura",
                                    style: TextStyles.black14Regular),
                              ],
                            ),
                            const Gap(4),
                            const Text("Address Description:",
                                style: TextStyles.black14Regular),
                            const Gap(4),
                            const Text("Mansoura, Hay Elgama, street",
                                style: TextStyles.darkGrey14Regular),
                            const Gap(8),
                            Image.asset(
                              "assets/images/map_location.png",
                              width: context.width,
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
