
import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/features/bottom_nav/presentation/views/bottom_nav_view.dart';

class OnBoardingSkipBtn extends StatelessWidget {
  const OnBoardingSkipBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>  context.navigateTo(
                          const BottomNavView(),
                        ),
      child: const Align(
        alignment: Alignment.topRight,
        child: Text(
          'Skip',
          style: TextStyles.darkGrey14SemiBold,
        ),
      ),
    );
  }
}