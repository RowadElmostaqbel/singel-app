import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/text_styles.dart';
import '../controllers/cubit/cart_cubit.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 24,
        right: 16,
        left: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal',
                style: TextStyles.black16SemiBold,
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return RichText(
                    text: TextSpan(
                      text:
                          '${context.read<CartCubit>().cart.map((model) => model.price).reduce((a, b) => a! + b!)}',
                      style: TextStyles.darkGrey16SemiBold,
                      children: const [
                        TextSpan(
                          text: ' SAR',
                          style: TextStyles.grey16Medium,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          const Gap(16),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text(
          //       'Shipping fee',
          //       style: TextStyles.black16SemiBold,
          //     ),
          //     RichText(
          //       text: const TextSpan(
          //         text: '10',
          //         style: TextStyles.darkGrey16SemiBold,
          //         children: [
          //           TextSpan(
          //             text: ' SAR',
          //             style: TextStyles.grey16Medium,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          // const Gap(18),
          Divider(
            color: const Color(0xffB7B7B7).withOpacity(.5),
          ),
          const Gap(18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyles.black16SemiBold,
              ),
              RichText(
                text: TextSpan(
                  text:
                      '${context.watch<CartCubit>().cart.map((model) => model.price).reduce((a, b) => a! + b!)}',
                  style: TextStyles.darkPrimary16SemiBold,
                  children: const [
                    TextSpan(
                      text: ' SAR',
                      style: TextStyles.black16SemiBold,
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
