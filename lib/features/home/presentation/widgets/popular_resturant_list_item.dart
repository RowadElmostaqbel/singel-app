

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';

import '../../../../core/utils/app_colors.dart';

class PopularResturantListItem extends StatelessWidget {
  const PopularResturantListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       // context.navigateTo(const RestaurantView());
      },
      child: SizedBox(
        width: context.width * .35,
        child: Stack(
          children: [
            Positioned(
              bottom: 5,
              right: 0,
              left: 0,
              child: Container(
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.bottomCenter,
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: LayoutBuilder(builder: (context, constraints) {
                  return SizedBox(
                    height: constraints.maxHeight * .6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'MC Donald’s',
                            style: TextStyles.black16SemiBold,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          itemSize: 15,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(
                            horizontal: 1.0,
                            vertical: 10.0,
                          ),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: AppColors.yellowColor,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset(Assets.assetsIconsDeliveryIc),
                            ),
                            const Gap(4),
                            const Text('Free delivery',
                                style: TextStyles.darkGrey14Regular),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 32,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(.2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: Image.asset(Assets.assetsIconsDistanceIc),
                              ),
                              const Text(
                                '120 m',
                                style: TextStyles.primary14Medium,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                Assets.assetsImagesMac,
                width: context.width * .25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
