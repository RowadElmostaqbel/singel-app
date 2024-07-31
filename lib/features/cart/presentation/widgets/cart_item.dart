import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../orders/data/models/order_model.dart';

class CartItem extends StatelessWidget {
  final OrderModel orderModel;
  const CartItem({
    super.key,
    required this.orderModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: CachedNetworkImageWidget(
              url: orderModel.meal.img ?? '',
            ),
          ),
          const Gap(8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderModel.meal.name ?? '',
                  style: TextStyles.black16SemiBold,
                ),
                Text(
                  orderModel.meal.details ?? '',
                  style: TextStyles.grey14Regular,
                ),
                RichText(
                  text: TextSpan(
                    text: orderModel.meal.price.toString(),
                    style: TextStyles.primary20SemiBold,
                    children: const [
                      TextSpan(
                        text: '  SAR',
                        style: TextStyles.black14Medium,
                      )
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
                    Container(
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
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Text(
                        orderModel.quantity.toString(),
                        style: TextStyles.black16SemiBold,
                      ),
                    ),
                    Container(
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
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
