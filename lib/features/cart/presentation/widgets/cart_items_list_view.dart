import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/cart/data/models/add_to_cart_data_model.dart';

import '../controllers/cubit/cart_cubit.dart';
import 'cart_item.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is SendCartToServerLoadedState) {
          context.read<CartCubit>().fetchCart();
        }
      },
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Container(
            constraints: BoxConstraints(
              maxHeight: context.height * .35,
            ),
            margin: const EdgeInsets.only(
              top: 45,
              bottom: 20,
            ),
            //   height: context.height * .35,
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => Dismissible(
                onDismissed: (direction) {
                  context.read<CartCubit>().sendCartDataToServe(
                        AddToCartDataModel(
                          itemId: context
                              .read<CartCubit>()
                              .cart[index]
                              .itemId
                              .toString(),
                          quantity: '0',
                        ),
                      );
                },
                direction: DismissDirection.endToStart,
                background: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    height: 36,
                    width: 36,
                    child: Image.asset(
                      Assets.assetsIconsTrash,
                    ),
                  ),
                ),
                key: UniqueKey(),
                child: CartItem(
                  cartModel: context.read<CartCubit>().cart[index],
                ),
              ),
              separatorBuilder: (context, index) => const Gap(16),
              itemCount: context.watch<CartCubit>().cart.length,
            ),
          );
        },
      ),
    );
  }
}
