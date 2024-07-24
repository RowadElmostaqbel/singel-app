
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../controllers/cubit/cart_cubit.dart';
import 'cart_item.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          height: context.height * .35,
          child: ListView.separated(
            itemBuilder: (context, index) => CartItem(
              orderModel: context.read<CartCubit>().cartModel!.orders[index],
            ),
            separatorBuilder: (context, index) => const Gap(16),
            itemCount: context.read<CartCubit>().cartModel!.orders.length,
          ),
        );
      },
    );
  }
}
