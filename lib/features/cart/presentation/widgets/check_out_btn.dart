import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../checkout/presentation/views/checkout_view.dart';

class CheckoutBtn extends StatelessWidget {
  const CheckoutBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateTo(
        const CheckoutView(),
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(bottom: 84, right: 12, left: 12),
        alignment: Alignment.center,
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Checkout',
            style: TextStyles.white18SemiBold,
          ),
        ),
      ),
    );
  }
}
