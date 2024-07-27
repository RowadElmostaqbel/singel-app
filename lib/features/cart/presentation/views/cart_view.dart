import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/features/cart/presentation/views/empty_cart_view.dart';
import 'package:single_resturant_app/features/cart/presentation/widgets/total_price_widget.dart';

import '../../../../core/utils/text_styles.dart';
import '../controllers/cubit/cart_cubit.dart';
import '../widgets/apply_coupon_widget.dart';
import '../widgets/cart_items_list_view.dart';
import '../widgets/check_out_btn.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: (context.read<CartCubit>().cartModel == null)
          ? null
          : const CheckoutBtn(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(24),
                const Center(
                  child: Text(
                    'Cart',
                    style: TextStyles.black16SemiBold,
                  ),
                ),
                if (context.read<CartCubit>().cartModel == null)
                  const EmptyCartView(),
                if (context.read<CartCubit>().cartModel != null)
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CartItemsListView(),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       'Coupons',
                      //       style: TextStyles.black18SemiBold,
                      //     ),
                      //     Gap(8),
                      //     ApplyCouponWidget(),
                      //   ],
                      // ),
                      // Gap(24),
                      TotalPriceWidget(),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
