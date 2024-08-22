import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/core/widgets/custom_btn_widget.dart';
import 'package:single_resturant_app/features/auth/presentation/views/login_view.dart';
import 'package:single_resturant_app/features/on_boarding/presentation/widgets/on_boarding_image_widget.dart';
import 'package:single_resturant_app/features/on_boarding/presentation/widgets/on_boarding_skip_btn.dart';
import 'package:single_resturant_app/features/on_boarding/presentation/widgets/on_boarding_title_widget.dart';

class OnBoardingView extends HookWidget {
  static const List<Map<String, String>> items = [
    {
      'title': 'Plan Your Weekly Menu',
      'desc': '''You Can Order Weekly Meals,and We,ll bring
Them Straight To Your Door''',
      'image': Assets.assetsImagesOnBoarding1,
    },
    {
      'title': 'Reserve A Table',
      'desc': '''Tired To Having To Wait ? Make A Table
Reservation Right Away''',
      'image': Assets.assetsImagesOnBoarding2,
    },
    {
      'title': 'Place Catering Orders',
      'desc': '''Place Catering Orders With Us''',
      'image': Assets.assetsImagesOnBoarding3,
    },
  ];
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> index = useState(0);
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(context.height * .05),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: OnBoardingSkipBtn(),
          ),
          Gap(context.height * .1),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            child: OnBoardingImageWidget(
              key: ValueKey<int>(index.value),
              image: items[index.value]['image']!,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                    child: OnBoardingTitleWidget(
                      key: ValueKey<int>(index.value),
                      title: items[index.value]['title']!,
                      desc: items[index.value]['desc']!,
                    ),
                  ),
                  const Spacer(),
                  CustomBtnWidget(
                    onTap: () {
                      if (index.value < 2) {
                        index.value = index.value + 1;
                      } else {
                        context.navigateTo(
                          const LoginView(),
                        );
                      }
                    },
                    radius: 12,
                    color: AppColors.primaryColor,
                    text: 'Next',
                    titleStyle: TextStyles.white18SemiBold,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
