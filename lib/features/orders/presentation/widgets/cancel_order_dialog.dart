import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/orders/presentation/widgets/cancel_order_reason_radio_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_btn_widget.dart';
import 'confirm_cancel_order_dialog.dart';

class CancelOrderDialog extends StatelessWidget {
  const CancelOrderDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        height: 200,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: context.width * .25,
                right: 6,
              ),
              alignment: Alignment.center,
              height: 150,
              width: context.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  24,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cancel Order',
                    style: TextStyles.black16SemiBold,
                  ),
                  const Text(
                    'Are you want to cancel order?',
                    style: TextStyles.brightBlack14SemiMedium,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomBtnWidget(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) =>
                                const ConfirmCancelOrderDialog(),
                          ),
                          color: AppColors.primaryColor,
                          text: 'Cancel',
                          titleStyle: TextStyles.white16Medium,
                        ),
                      ),
                      Expanded(
                        child: CustomBtnWidget(
                          onTap: () => context.pop(),
                          color: const Color(0xffF4F4F4),
                          text: 'Back',
                          titleStyle: TextStyles.black16Medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: 0,
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  Assets.assetsIconsCancelOrderIc,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 75,
                width: 85,
                child: Image.asset(Assets.assetsImagesBubles),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
