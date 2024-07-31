import 'package:flutter/material.dart';
import 'package:single_resturant_app/features/checkout/presentation/widgets/reservation_way_container.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_navigator_button.dart';
import '../../../../core/widgets/add_new_address_dialog.dart';
import '../widgets/custom_price_container.dart';
import '../widgets/custom_address_container.dart';
import '../widgets/custom_coupon_row.dart';
import '../widgets/custom_main_row.dart';
import '../widgets/order_done_dialog.dart';
import '../widgets/payment_method_container.dart';
import '../widgets/time_options_container.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Align(
          alignment: const Alignment(1.5, 0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const SizedBox(
              height: 40,
              width: 40,
              child: Card(
                elevation: 4,
                color: Colors.white,
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color:AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          "Checkout",
          style: TextStyles.black16SemiBold,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomMainRow(
                title: 'Delivery Address',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AddNewAddressDialog();
                      });
                },
              ),
              SizedBox(
                height: 143,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: const [
                    CustomAddressContainer(
                      containerBorderColor: AppColors.primaryColor,
                      title: 'Office',
                    ),
                    CustomAddressContainer(
                      containerBorderColor: AppColors.greyColor,
                      title: 'Home',
                    ),
                  ],
                ),
              ),
              const Text(
                "Time Options",
                style: TextStyles.black16SemiBold,
              ),
              const TimeOptionsContainer(),
              const Text(
                "Reservation Way",
                style: TextStyles.black16SemiBold,
              ),
              const ReservationWayContainer(),
              const Text(
                "Payment Methods",
                style: TextStyles.black16SemiBold,
              ),
              const PaymentMethodContainer(),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8.0),
                child: Text(
                  "Coupons",
                  style: TextStyles.black16SemiBold,
                ),
              ),
              const CustomCouponRow(),
              const CustomPriceContainer(),
              CustomNavigatorButton(title: "Order Now", onPressed: (){showDialog(
                  context: context,
                  builder: (context) {
                    return const OrderDoneDialog();
                  });}, padding: 20,)

            ],
          ),
        ),
      ),
    );
  }
}
