import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';
import 'package:single_resturant_app/features/cart/data/models/cart_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../data/models/add_to_cart_data_model.dart';
import '../controllers/cubit/cart_cubit.dart';

class CartItem extends HookWidget {
  final CartModel cartModel;
  const CartItem({
    super.key,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> quantity = useState(cartModel.quantity ?? 0);
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is SendCartToServerLoadedState) {
          context.read<CartCubit>().fetchCart();
        }
      },
      child: Container(
        height: 90,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: const Color(0xffF3F3F3),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImageWidget(
                  url: cartModel.img ?? '',
                ),
              ),
            ),
            const Gap(8),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartModel.name ?? '',
                    style: TextStyles.black16SemiBold,
                  ),
                  Text(
                    cartModel.desc ?? '',
                    style: TextStyles.grey14Regular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  RichText(
                    text: TextSpan(
                      text: cartModel.price.toString(),
                      style: TextStyles.primary20SemiBold,
                      children: const [
                        TextSpan(
                          text: '  SAR',
                          style: TextStyles.black14Medium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            context.read<CartCubit>().sendCartDataToServe(
                                  AddToCartDataModel(
                                    itemId: cartModel.itemId.toString(),
                                    quantity: (--quantity.value).toString(),
                                  ),
                                ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const FittedBox(
                            child: Icon(
                              Icons.remove,
                              color: AppColors.darkPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Text(
                          quantity.value.toString(),
                          style: TextStyles.black16SemiBold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<CartCubit>().sendCartDataToServe(
                                AddToCartDataModel(
                                  itemId: cartModel.itemId.toString(),
                                  quantity: (++quantity.value).toString(),
                                ),
                              );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const FittedBox(
                            child: Icon(
                              Icons.add,
                              color: AppColors.darkPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
