import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/features/orders/data/models/cancel_reason_model.dart';
import 'package:single_resturant_app/features/orders/presentation/controllers/order/cancel_order_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CancelOrderReasonRadioWidget extends HookWidget {
  const CancelOrderReasonRadioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<CancelReasonModel> selectedReason = useState(
      context.read<CancelOrderCubit>().cancelReasons[0],
    );
    useEffect(() {
      context.read<CancelOrderCubit>().addCancelReason(
            id: selectedReason.value.id!,
            reason: selectedReason.value.reason!,
          );
      return null;
    }, []);
    return BlocBuilder<CancelOrderCubit, CancelOrderState>(
      builder: (context, state) {
        List<CancelReasonModel> reasons =
            context.watch<CancelOrderCubit>().cancelReasons;

        return Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: reasons
                  .map(
                    (reason) => Container(
                      margin: const EdgeInsets.only(
                        bottom: 12,
                      ),
                      child: RadioListTile<CancelReasonModel>(
                        activeColor: AppColors.primaryColor,
                        value: reason,
                        groupValue: selectedReason.value,
                        onChanged: (val) {
                          context
                              .read<CancelOrderCubit>()
                              .clearCancelReasonData();
                          selectedReason.value = val!;

                          context.read<CancelOrderCubit>().addCancelReason(
                                id: selectedReason.value.id!,
                                reason: selectedReason.value.reason!,
                              );
                        },
                        title: Text(
                          reason.reason ?? 'Other',
                          style: TextStyles.black14Regular,
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  )
                  .toList(),
            ),
            if (selectedReason.value.id == 0)
              Column(
                children: [
                  Divider(
                    height: 1,
                    color: AppColors.greyColor.withOpacity(0.6),
                  ),
                  const Gap(16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: AppColors.greyColor.withOpacity(0.6),
                      ),
                    ),
                    child: TextField(
                      cursorHeight: 16,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type Here...',
                        hintStyle: TextStyles.brightBlack14SemiMedium,
                        contentPadding: EdgeInsets.only(
                          bottom: 24,
                        ),
                      ),
                      onChanged: (value) {
                        context.read<CancelOrderCubit>().addCancelReason(
                              id: selectedReason.value.id!,
                              reason: value,
                            );
                      },
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
