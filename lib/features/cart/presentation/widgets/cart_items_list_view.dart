import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
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
              direction: DismissDirection.endToStart,
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: const Color(0xffFFF7F4),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(Assets.assetsIconsTrash),
                ),
              ),
              key: Key(
                index.toString(),
              ),
              child: CartItem(
                cartModel: context.read<CartCubit>().cart[index],
              ),
            ),
            separatorBuilder: (context, index) => const Gap(16),
            itemCount: context.read<CartCubit>().cart.length,
          ),
        );
      },
    );
  }
}
