

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/add_to_fav_btn.dart';

import '../../../../core/utils/assets.dart';

class FastDelivaryListItem extends StatelessWidget {
  final bool fromShowAll;
  const FastDelivaryListItem({
    super.key,
    required this.fromShowAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: context.width * .6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.antiAlias,
                height: constraints.maxHeight * .6,
                width: constraints.maxWidth,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      Assets.assetsImagesSteak,
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        height: 25,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30,
                            ),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.yellowColor,
                            ),
                            Gap(6),
                            Text(
                              '4.2',
                              style: TextStyles.darkGrey14Regular,
                            ),
                          ],
                        )),
                    const AddToFavBtn(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Burger King',
                      style: TextStyles.darkGrey14SemiBold,
                    ),
                    if (fromShowAll)
                      Row(
                        children: [
                          SizedBox(
                            height: 12,
                            width: 12,
                            child:
                                Image.asset(Assets.assetsIconsDeliveryTimeIc),
                          ),
                          const Gap(6),
                          const Text(
                            '45',
                            style: TextStyles.black18Medium,
                          ),
                          const Gap(6),
                          Text(
                            'min',
                            style: TextStyles.darkGrey14Regular
                                .copyWith(fontSize: 12),
                          ),
                          const Gap(6),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 12,
                              width: 12,
                              child: Image.asset(Assets.assetsIconsDeliveryIc),
                            ),
                            const Gap(6),
                            const Text(
                              'Free delivery',
                              style: TextStyles.darkGrey14Regular,
                            )
                          ],
                        ),
                        if (!fromShowAll)
                          Row(
                            children: [
                              SizedBox(
                                height: 12,
                                width: 12,
                                child: Image.asset(
                                    Assets.assetsIconsDeliveryTimeIc),
                              ),
                              const Gap(6),
                              const Text(
                                '45',
                                style: TextStyles.black18Medium,
                              ),
                              const Gap(6),
                              Text(
                                'min',
                                style: TextStyles.darkGrey14Regular
                                    .copyWith(fontSize: 12),
                              ),
                              const Gap(6),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
