import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/add_to_fav_btn.dart';

import '../../../../core/utils/assets.dart';

class OfferListITem extends StatelessWidget {
  const OfferListITem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(8),
      width: context.width * .55,
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
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.antiAlias,
              height: constraints.maxHeight * .5,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: const DecorationImage(
                  image: AssetImage(
                    Assets.assetsImagesSteak,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 32,
                    width: constraints.maxWidth * .3,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.darkPrimaryColor,
                          AppColors.primaryColor,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(18),
                        topLeft: Radius.circular(18),
                      ),
                    ),
                    child: const Text(
                      '10% 0ff',
                      style: TextStyles.white14Medium,
                    ),
                  ),
                  const Spacer(),
                  const AddToFavBtn(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(4),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Buffalo Chicken Mac & Cheese Plate',
                          style: TextStyles.darkGrey14SemiBold,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Meat Offer',
                          style: TextStyles.primary14Medium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            'This offer have 2 meat Pieces with mac & cheese',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.darkGrey14Regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '75',
                        style: TextStyles.darkGrey16SemiBold.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        'SAR',
                        style: TextStyles.darkGrey16SemiBold.copyWith(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const Gap(6),
                      const Text(
                        '75',
                        style: TextStyles.primary18SemiBold,
                      ),
                      const Gap(6),
                      Text(
                        'SAR',
                        style:
                            TextStyles.primary14Regular.copyWith(fontSize: 12),
                      ),
                      const Gap(6),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
