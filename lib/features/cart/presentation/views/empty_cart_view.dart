
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Gap(context.height * .2),
        Image.asset(
          Assets.assetsImagesEmptyCart,
          width: context.width * .75,
        ),
        const Gap(36),
        const Text(
          'Your Cart is Empty',
          style: TextStyles.black24SemiBold,
        ),
        const Gap(12),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            'Looks like you haven’t added anything to your cart yet',
            style: TextStyles.grey16Medium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
