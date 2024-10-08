import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';
import 'package:single_resturant_app/core/widgets/custom_app_bar.dart';
import 'package:single_resturant_app/features/orders/data/models/my_order_model.dart';
import 'package:single_resturant_app/features/review/presentation/controllers/review_cubit.dart';                              
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../review/presentation/widgets/add_review_widget.dart';
import '../widgets/order_delivery_details.dart';

class OrderDetails extends StatelessWidget {
  final bool fromHistory;
  final MyOrderModel orderModel;
  const OrderDetails({
    super.key,
    required this.orderModel,
    this.fromHistory = false,
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
                          if (fromHistory) const AddReviewWidget(),
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

class OrderItemsListView extends HookWidget {
  const OrderItemsListView({
    super.key,
    required this.orderModel,
  });

  final MyOrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> selectedItemIndex = useState(-1);
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => selectedItemIndex.value == index
          ? SelectedOrderMealsListItem(
              orderItemModel: orderModel.orderItems[index],
            )
          : GestureDetector(
              onTap: () => selectedItemIndex.value = index,
              child: UnSelectedOrderMealsListItem(
                orderItemModel: orderModel.orderItems[index],
              ),
            ),
      separatorBuilder: (context, index) => const Gap(14),
      itemCount: orderModel.orderItems.length,
    );
  }
}

class UnSelectedOrderMealsListItem extends StatelessWidget {
  final OrderItemModel orderItemModel;
  const UnSelectedOrderMealsListItem({
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

class SelectedOrderMealsListItem extends HookWidget {
  final OrderItemModel orderItemModel;
  const SelectedOrderMealsListItem({
    super.key,
    required this.orderItemModel,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<ReviewCubit>().addToDataModel(itemId: orderItemModel.id);
      return null;
    }, []);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: AppColors.primaryColor,
        ),
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
