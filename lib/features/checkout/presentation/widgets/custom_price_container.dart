import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import 'price_details_row.dart';

class CustomPriceContainer extends StatelessWidget {
  const CustomPriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      height: MediaQuery.sizeOf(context).height*0.23,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          PriceDetailsRow(title: 'Subtotal', price: '150',),
          PriceDetailsRow(title: 'Coupon Discount', price: '15',),
          PriceDetailsRow(title: 'Shipping fee', price: '25',),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 1,
            color: AppColors.greyColor.withOpacity(0.5),
          ),
          PriceDetailsRow(title: 'Shipping fee', price: '160', isTotal: true,),
        ],
      ),
    );
  }
}
