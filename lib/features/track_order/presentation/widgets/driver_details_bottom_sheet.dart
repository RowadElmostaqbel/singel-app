import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';

class DriverDetailsBottomSheet extends StatelessWidget {
  const DriverDetailsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 18,
      ),
      width: context.width,
      height: context.height * .5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffF23F39),
            Color(0xffBD0600),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  Assets.assetsImagesBurgerjfif,
                ),
              ),
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
            ),
          ),
          const Gap(6),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mohamed Ali',
                  style: TextStyles.white18SemiBold,
                ),
                Text(
                  '95,000 SAR',
                  style: TextStyles.white16Medium,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(.2),
            ),
            child: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(
                Assets.assetsIconsCallIc,
                color: Colors.white,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
