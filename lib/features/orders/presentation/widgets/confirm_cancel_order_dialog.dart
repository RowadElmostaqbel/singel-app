import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/custom_toast_widget.dart';
import 'package:single_resturant_app/features/orders/presentation/controllers/order/cancel_order_cubit.dart';
import 'package:single_resturant_app/features/orders/presentation/widgets/cancel_order_reason_radio_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_btn_widget.dart';

class ConfirmCancelOrderDialog extends StatelessWidget {
  final String orderId;
  const ConfirmCancelOrderDialog({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CancelOrderCubit, CancelOrderState>(
      listener: (context, state) {
        if (state is CancelOrderStatus && state.status) {
          context.pop();
          context.pop();
          showTaost('Order Canceled', AppColors.primaryColor);
        }
      },
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        content: Container(
          width: context.width * .75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: 50,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Stack(
                  children: [
                    const Center(
                      child: Text(
                        'Cancel Order',
                        style: TextStyles.white18SemiBold,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Gap(32),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select some of the reasons that made you cancel the order',
                      style: TextStyles.darkGrey14Regular,
                    ),
                    const Gap(24),
                    const CancelOrderReasonRadioWidget(),
                    const Gap(36),
                    CustomBtnWidget(
                      onTap: () {
                        context.read<CancelOrderCubit>().cancelOrder(
                              orderId: orderId,
                            );
                      },
                      color: AppColors.primaryColor,
                      text: 'Confirm',
                      titleStyle: TextStyles.white16Medium,
                      radius: 12,
                    ),
                    const Gap(24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
