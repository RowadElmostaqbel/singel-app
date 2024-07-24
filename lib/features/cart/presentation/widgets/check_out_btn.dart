
import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CheckoutBtn extends StatelessWidget {
  const CheckoutBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    //  onTap: () => context.navigateTo(const CheckoutView()),
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.only(bottom: 8, right: 24, left: 24),
        alignment: Alignment.center,
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            const Center(
                child: Text('Checkout', style: TextStyles.white18SemiBold)),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                alignment: Alignment.center,
                height: 56,
                width: 56,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const FittedBox(
                  child: Icon(
                    Icons.arrow_forward_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
