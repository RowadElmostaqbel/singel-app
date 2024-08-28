import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/features/orders/presentation/widgets/order_status_widget.dart';

enum OrderStatusEnum {
  active,
  completed,
  canceled,
}

class OrderStatusWidgetBuilder extends StatelessWidget {
  final OrderStatusEnum orderStatus;
  final bool showConatiner;
  const OrderStatusWidgetBuilder({
    super.key,
    required this.orderStatus,
    this.showConatiner=false,
  });

  Color getColor() {
    switch (orderStatus) {
      case OrderStatusEnum.active:
        return AppColors.greenColor;
      case OrderStatusEnum.completed:
        return Colors.blueAccent;
      case OrderStatusEnum.canceled:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrderStatusWidget(
      showConatiner: showConatiner,
      color: getColor(),
      status: orderStatus.name,
    );
  }
}
