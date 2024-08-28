import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/custom_navigator_button.dart';
import 'package:single_resturant_app/features/track_order/presentation/views/track_order_view.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../bottom_nav/presentation/views/bottom_nav_view.dart';

class OrderDoneDialog extends StatefulWidget {
  const OrderDoneDialog({super.key});

  @override
  State<OrderDoneDialog> createState() => _OrderDoneDialogState();
}

class _OrderDoneDialogState extends State<OrderDoneDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(24),
      backgroundColor: Colors.white,
      content: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.45,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () {
                      context.navigateTo(const BottomNavView());
                    },
                    child: Image.asset(
                      "assets/icons/delete.png",
                      scale: 0.7,
                    ))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset("assets/images/order_done.png"),
            ),
            const Text(
              "Order Placed Successfully!",
              style: TextStyles.black16SemiBold,
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  width: constraints.maxWidth * 0.7,
                  margin: const EdgeInsets.only(top: 8, bottom: 20),
                  child: const Text(
                      "Your order was placed successfully.For more details, ",
                      textAlign: TextAlign.center,
                      style: TextStyles.grey14Regular),
                );
              },
            ),
            CustomNavigatorButton(
                title: "Track Order",
                onPressed: () {
                  context.navigateTo(
                    const TrackOrderView(),
                  );
                },
                padding: 10)
          ],
        ),
      ),
    );
  }
}
