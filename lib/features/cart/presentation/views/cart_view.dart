import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/cart/presentation/views/empty_cart_view.dart';
import 'package:single_resturant_app/features/cart/presentation/widgets/total_price_widget.dart';

import '../../../../core/utils/text_styles.dart';
import '../controllers/cubit/cart_cubit.dart';
import '../widgets/cart_items_list_view.dart';
import '../widgets/check_out_btn.dart';

class CartView extends HookWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<CartCubit>().fetchCart();
      return null;
    }, []);
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomSheet: (context.read<CartCubit>().cart.isEmpty)
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
                    (context.read<CartCubit>().cart.isEmpty &&
                            state is! FetchCartLoadingState)
                        ? const EmptyCartView()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (context.read<CartCubit>().cart.isEmpty &&
                                  state is FetchCartLoadingState)
                                Container(
                                    margin: EdgeInsets.only(
                                      top: context.height * .35,
                                    ),
                                    child: const CircularProgressIndicator()),
                              if (context
                                  .read<CartCubit>()
                                  .cart
                                  .isNotEmpty) ...[
                                const CartItemsListView(),
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
                                const TotalPriceWidget(),
                              ]
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
