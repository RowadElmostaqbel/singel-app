

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_btn_widget.dart';

class UpcomingOrdersView extends StatelessWidget {
  const UpcomingOrdersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        left: 4,
        right: 4,
        top: 12,
        bottom: 12,
      ),
      itemBuilder: (context, index) => const UpcomingOrderListItem(),
      separatorBuilder: (context, index) => const Gap(20),
      itemCount: 5,
    );
  }
}

class UpcomingOrderListItem extends StatelessWidget {
  const UpcomingOrderListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 85,
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 85,
                  child: Stack(
                    children: [
                      Container(
                        height: 75,
                        width: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent,
                        ),
                        child: Image.asset(
                          Assets.assetsImagesBurgerjfif,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Image.asset(Assets.assetsImagesMac),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Beef Burger',
                        style: TextStyles.black18SemiBold,
                      ),
                      const Gap(8),
                      RichText(
                        text: const TextSpan(
                          text: '2',
                          style: TextStyles.primary14Medium,
                          children: [
                            TextSpan(
                              text: ' Items',
                              style: TextStyles.black14Regular,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset(Assets.assetsIconsTimeIc),
                  ),
                  const Gap(8),
                  const Text(
                    'Order Date',
                    style: TextStyles.brightBlack14SemiMedium,
                  ),
                ],
              ),
              const Text(
                '10-7-2024',
                style: TextStyles.black16Medium,
              ),
            ],
          ),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset(Assets.assetsIconsDollar),
                  ),
                  const Gap(8),
                  const Text(
                    'Total',
                    style: TextStyles.brightBlack14SemiMedium,
                  ),
                ],
              ),
              RichText(
                text: const TextSpan(
                  text: '75',
                  style: TextStyles.black16SemiBold,
                  children: [
                    TextSpan(
                      text: ' SAR',
                      style: TextStyles.primary14Medium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset(Assets.assetsIconsCandle),
                  ),
                  const Gap(8),
                  const Text(
                    'Order Status',
                    style: TextStyles.brightBlack14SemiMedium,
                  ),
                ],
              ),
              const Text(
                'Active',
                style: TextStyles.primary18SemiBold,
              ),
            ],
          ),
          const Divider(
            color: Color(0xffebebeb),
          ),
          Row(
            children: [
              const CustomBtnWidget(
                onTap: null,
                color: AppColors.primaryColor,
                text: 'Track Order',
                titleStyle: TextStyles.white16Medium,
              ),
              Expanded(
                child: CustomBtnWidget(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
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
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Cancel Order',
                                      style: TextStyles.black16SemiBold,
                                    ),
                                    Text(
                                      'Are you want to cancel order?',
                                      style: TextStyles.brightBlack14SemiMedium,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomBtnWidget(
                                            onTap: null,
                                            color: AppColors.primaryColor,
                                            text: 'Cancel',
                                            titleStyle:
                                                TextStyles.white16Medium,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomBtnWidget(
                                            onTap: null,
                                            color: Color(0xffF4F4F4),
                                            text: 'Back',
                                            titleStyle:
                                                TextStyles.black16Medium,
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
                      ),
                    );
                  },
                  color: const Color(0xffF4F4F4),
                  text: 'Cancel',
                  titleStyle: TextStyles.black16Medium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
