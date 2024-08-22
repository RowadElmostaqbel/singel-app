import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/core/widgets/custom_app_bar.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            SizedBox(
              height: context.height * .18,
              width: context.width,
              child: Image.asset(
                Assets.assetsImagesProfileBackground,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: CustomAppBar(
                  title: 'About Us',
                  style: TextStyles.white18SemiBold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: context.height * .89,
                width: context.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 24,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 160,
                      width: context.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage(
                            Assets.assetsImagesAboutUs,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const Gap(12),
                    const Text(
                      '''Welcome to Rowad AL Mustaqbal, where innovation meets excellence in the world of restaurant management. We are a forward-thinking technology company dedicated to transforming the way restaurants operate through our state-of-the-art ERP system, designed specifically for the unique needs of the food service industry.''',
                      style: TextStyles.black18Medium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
