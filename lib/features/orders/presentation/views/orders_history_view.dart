import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/orders/presentation/controllers/order/orders_cubit.dart';
import 'package:single_resturant_app/features/orders/presentation/widgets/order_history_list_item.dart';

import '../../../../core/utils/assets.dart';
import '../../data/models/my_order_model.dart';

class OrdersHistoryView extends StatelessWidget {
  const OrdersHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrderState>(
      builder: (context, state) {
        List<MyOrderModel> myOrders = context
            .watch<OrdersCubit>()
            .myOrders
            .where((order) => order.orderStatus == 'cancelled')
            .toList();
        if (myOrders.isNotEmpty) {
          return ListView.separated(
            padding: const EdgeInsets.only(
              left: 4,
              right: 4,
              top: 12,
              bottom: 64,
            ),
            itemBuilder: (context, index) => OrderHistoryListItem(
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
    );
  }
}
