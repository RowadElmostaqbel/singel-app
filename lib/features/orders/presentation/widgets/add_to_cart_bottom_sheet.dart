import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/core/errors/error_handler.dart';
import 'package:single_resturant_app/features/cart/data/models/add_to_cart_data_model.dart';
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
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is SendCartToServerLoadedState && state.status) {
          context
              .read<OrderAnimationCubit>()
              .addOrdersToAnimationList(orderModel);
        } else if (state is SendCartToServerFailureState) {
          ErrorHandler.handleError(
            failure: state.failure,
            context: context,
          );
        }
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
          borderRadius: const BorderRadius.only(
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
                context.read<CartCubit>().sendCartDataToServe(
                      AddToCartDataModel(
                        itemId: orderModel.meal.id.toString(),
                        quantity: quantity.value.toString(),
                      ),
                    );
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 8,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.darkPrimaryColor,
                ),
                child: const Text(
                  'Add To Cart',
                  style: TextStyles.white18SemiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
