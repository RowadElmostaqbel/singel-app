import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';


class OrderStatusWidget extends StatelessWidget {
  final String status;
  final Color color;
  final bool showConatiner;

  const OrderStatusWidget({
    super.key,
    required this.color,
    required this.status,
    required this.showConatiner,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: showConatiner ? color.withOpacity(.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment:
            showConatiner ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Icon(
            Icons.circle,
            size: 10,
            color: color,
          ),
          const Gap(8),
          Text(
            '${showConatiner ? '' : 'Order'}' ' ${status.capitalize()}',
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
