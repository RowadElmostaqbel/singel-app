import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/orders/presentation/views/active_order_view.dart';
import 'package:single_resturant_app/features/orders/presentation/widgets/order_history_list_item.dart';
import 'package:single_resturant_app/features/orders/presentation/widgets/order_status_widget_builder.dart';

import '../../../../core/utils/text_styles.dart';

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
      itemBuilder: (context, index) => OrderHistoryListItem(),
      separatorBuilder: (context, index) => const Gap(20),
      itemCount: 5,
    );
  }
}

