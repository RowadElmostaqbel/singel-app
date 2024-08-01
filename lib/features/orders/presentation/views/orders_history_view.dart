import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/features/orders/presentation/widgets/order_history_list_item.dart';


class OrdersHistoryView extends StatelessWidget {
  const OrdersHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        left: 4,
        right: 4,
        top: 12,
        bottom: 64,
      ),
      itemBuilder: (context, index) => const OrderHistoryListItem(),
      separatorBuilder: (context, index) => const Gap(20),
      itemCount: 5,
    );
  }
}

