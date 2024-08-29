import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_resturant_app/features/coupons/presentation/controllers/coupon_cubit.dart';
import 'package:single_resturant_app/features/orders/presentation/controllers/order/cancel_order_cubit.dart';

class CustomBtnWidget extends StatelessWidget {
  final Color color;
  final String text;
  final TextStyle titleStyle;

  final Function()? onTap;
  final double? radius;
  final Border? border;
  const CustomBtnWidget({
    super.key,
    required this.color,
    required this.text,
    required this.titleStyle,
    this.onTap,
    this.radius,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CouponCubit, CouponState>(
      builder: (context, state) {
        return BlocBuilder<CancelOrderCubit, CancelOrderState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () => onTap != null ? onTap!() : () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 50),
                  color: color,
                  border: border,
                ),
                child: state is CancelOrderLoadingState || state is ApplyCouponLoadingState
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        text,
                        style: titleStyle,
                      ),
              ),
            );
          },
        );
      },
    );
  }
}
