import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';
import 'package:single_resturant_app/features/orders/data/models/my_order_model.dart';
import 'package:single_resturant_app/features/orders/presentation/controllers/order/cancel_order_cubit.dart';
import 'package:single_resturant_app/features/orders/presentation/controllers/order/orders_cubit.dart';
import 'package:single_resturant_app/features/orders/presentation/views/order_details.dart';
import 'package:single_resturant_app/features/orders/presentation/widgets/order_status_widget_builder.dart';
import 'package:single_resturant_app/features/track_order/presentation/views/track_order_view.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_btn_widget.dart';
import '../widgets/cancel_order_dialog.dart';

class ActiveOrdersView extends StatelessWidget {
  const ActiveOrdersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CancelOrderCubit, CancelOrderState>(
      listener: (context, state) {
        if (state is CancelOrderStatus && state.status) {
          context.read<OrdersCubit>().fetchMyOrders();
        }
      },
      child: BlocBuilder<OrdersCubit, OrderState>(
        builder: (context, state) {
          List<MyOrderModel> myOrders = context
              .watch<OrdersCubit>()
              .myOrders
              .where((order) => order.orderStatus != 'cancelled')
              .toList();
          if (myOrders.isNotEmpty) {
            return ListView.separated(
              padding: const EdgeInsets.only(
                left: 4,
                right: 4,
                top: 12,
                bottom: 64,
              ),
              itemBuilder: (context, index) => ActiveOrderListItem(
                orderModel: myOrders[index],
              ),
              separatorBuilder: (context, index) => const Gap(20),
              itemCount: myOrders.length,
            );
          } else if (state is OrdersLoadingState && myOrders.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Image.asset(
              Assets.assetsImagesEmpty,
              width: context.width * .5,
            ),
          );
        },
      ),
    );
  }
}

class ActiveOrderListItem extends StatelessWidget {
  final MyOrderModel orderModel;
  const ActiveOrderListItem({
    super.key,
    required this.orderModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(
          OrderDetails(
            orderModel: orderModel,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 85,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 75,
                    width: 80,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CachedNetworkImageWidget(
                      url: orderModel.orderItems.first.image ?? '',
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          orderModel.orderItems.first.name ?? '',
                          style: TextStyles.black18SemiBold,
                        ),
                        const Gap(8),
                        RichText(
                          text: TextSpan(
                            text: orderModel.orderItems.length.toString(),
                            style: TextStyles.primary14Medium,
                            children: const [
                              TextSpan(
                                text: ' Items',
                                style: TextStyles.black14Regular,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '#',
                            style: TextStyles.primary14Medium,
                            children: [
                              TextSpan(
                                text: orderModel.id.toString(),
                                style: TextStyles.black14Medium,
                              ),
                            ],
                          ),
                        ),
                        const Gap(12),
                        const OrderStatusWidgetBuilder(
                          orderStatus: OrderStatusEnum.active,
                          showConatiner: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                RichText(
                  text: TextSpan(
                    text: orderModel.price,
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
                Text(
                  orderModel.orderType,
                  style: TextStyles.primary12SemiBold,
                ),
              ],
            ),
            const Divider(
              color: Color(0xffebebeb),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomBtnWidget(
                    radius: 12,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => CancelOrderDialog(
                          orderId: orderModel.id.toString(),
                        ),
                      );
                    },
                    color: Colors.white,
                    text: 'Cancel',
                    titleStyle: TextStyles.primary16Medium,
                    border: Border.all(
                      width: 1,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Expanded(
                  child: CustomBtnWidget(
                    onTap: () {
                      context.navigateTo(
                        const TrackOrderView(),
                      );
                    },
                    color: AppColors.primaryColor,
                    text: 'Track Order',
                    titleStyle: TextStyles.white16Medium,
                    radius: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
