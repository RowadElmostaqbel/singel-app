
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/features/orders/presentation/controllers/order_animation/cubit/order_animation_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../cart/presentation/controllers/cubit/cart_cubit.dart';
import '../../data/models/order_model.dart';

class AddToCartBottomSheet extends HookWidget {
  final OrderModel orderModel;
  const AddToCartBottomSheet({
    super.key,
    required this.orderModel,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> quantity = useState(1);
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => quantity.value =
                    quantity.value == 1 ? 1 : quantity.value - 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  alignment: Alignment.center,
                  height: 32,
                  width: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF4F4F4),
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: AppColors.darkPrimaryColor,
                  ),
                ),
              ),
              Text(
                '${quantity.value}',
                style: TextStyles.black24SemiBold,
              ),
              GestureDetector(
                onTap: () => quantity.value = quantity.value + 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  alignment: Alignment.center,
                  height: 32,
                  width: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF4F4F4),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.darkPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              

              context.read<CartCubit>().addOrderToCart(orderModel: orderModel);
              context
                  .read<OrderAnimationCubit>()
                  .addOrdersToAnimationList(orderModel);
                 
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 8,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.darkPrimaryColor.withOpacity(.2),
              ),
              child: const Text(
                'Add To Cart',
                style: TextStyles.primary24SemiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
