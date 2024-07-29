
import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';

class CustomSearchResultItem extends StatelessWidget {
  const CustomSearchResultItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: context.width * .42,
      child: Stack(
        children: [
          Positioned(
            bottom: 5,
            right: 0,
            left: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 210,
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
                          'Spaghetti Chicken Cheese',
                          style: TextStyles.black14Regular,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColors.yellowColor,
                                ),
                                Text(
                                  '4.2',
                                  style:
                                  TextStyles.darkGrey14Regular.copyWith(
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              '65 SAR',
                              style: TextStyles.primary14Regular,
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
              Assets.assetsImagesDish,
              width: context.width * .35,
            ),
          ),
        ],
      ),
    );
  }
}
