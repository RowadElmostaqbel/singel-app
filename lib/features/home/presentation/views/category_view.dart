import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/core/widgets/custom_app_bar.dart';
import 'package:single_resturant_app/core/widgets/custom_rating_widget.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/add_to_fav_btn.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/custom_stepper_widget.dart';

class CategoryView extends HookWidget {
  final String title;
  const CategoryView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isResturentSelected = useState(false);
    final PageController pageController = usePageController(initialPage: 0);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              CustomAppBar(
                title: title,
              ),
              const Gap(34),
              SizedBox(
                width: context.width,
                height: 80,
                child: CustomStepperWidget(
                  isResturentSelected: isResturentSelected,
                  pageController: pageController,
                ),
              ),
              Expanded(
                child: CategoriesPageView(
                  pageController,
                  isResturentSelected,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesPageView extends HookWidget {
  final ValueNotifier<bool> isResturentSelected;

  final PageController pageController;
  const CategoriesPageView(
    this.pageController,
    this.isResturentSelected, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      children: [
        ResturantCategoryView(
          isResturentSelected,
        ),
        const MealsCategoryView(),
      ],
    );
  }
}

class MealsCategoryView extends StatelessWidget {
  const MealsCategoryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(
        top: 12,
        right: 12,
        bottom: 12,
        left: 4,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1,
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 24,
      ),
      itemBuilder: (context, index) => const MealGridItem(),
      itemCount: 9,
    );
  }
}

class MealGridItem extends StatelessWidget {
  const MealGridItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.antiAlias,
                width: constraints.maxWidth,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
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
                    const AddToFavBtn(
                      isLiked: false,
                      mealId: '',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Burger King',
                      style: TextStyles.darkGrey14SemiBold,
                    ),
                    Text(
                      '65 SAR',
                      style: TextStyles.primary14Regular.copyWith(
                        fontSize: 18,
                      ),
                    )
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

class ResturantCategoryView extends HookWidget {
  final ValueNotifier<bool> isResturentSelected;

  const ResturantCategoryView(
    this.isResturentSelected, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          isResturentSelected.value = true;
        },
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  Assets.assetsImagesMac,
                ),
              ),
              const Gap(14),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MC Donald’s',
                      style: TextStyles.black16SemiBold,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const CustomRatingWidget(),
                    Row(
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
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const AddToFavBtn(
                      isLiked: false,
                      mealId: '',
                    ),
                    const Gap(15),
                    Row(
                      children: [
                        SizedBox(
                          height: 12,
                          width: 12,
                          child: Image.asset(Assets.assetsIconsDeliveryTimeIc),
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
                        //const Gap(6),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: 8,
    );
  }
}

class CustomTabBar extends HookWidget {
  final PageController pageController;
  final List<String> titles;
  const CustomTabBar(
    this.pageController, {
    super.key,
    required this.titles,
  });
  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> index = useState(0);
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xffF4F4F4),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: titles
            .map(
              (title) => index.value == titles.indexOf(title)
                  ? Expanded(
                      child: SelectedTabBarItem(
                        title: title,
                      ),
                    )
                  : Expanded(
                      child: GestureDetector(
                        onTap: () {
                          index.value = titles.indexOf(title);
                          pageController.animateToPage(
                            index.value,
                            duration: const Duration(
                              milliseconds: 250,
                            ),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: UnSelectedTabBarItem(
                          title: title,
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}

class UnSelectedTabBarItem extends StatelessWidget {
  final String title;

  const UnSelectedTabBarItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.black16Medium,
      textAlign: TextAlign.center,
    );
  }
}

class SelectedTabBarItem extends StatelessWidget {
  final String title;
  const SelectedTabBarItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.primaryColor,
      ),
      child: Text(
        title,
        style: TextStyles.white14Medium.copyWith(
          fontSize: 16,
        ),
      ),
    );
  }
}
