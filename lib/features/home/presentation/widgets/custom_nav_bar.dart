
import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
  });

  final ValueNotifier<int> selectedIndex;
  static List<Map<String, String>> items = [
    {'title': 'Home', 'image': Assets.assetsIconsHomeIc},
    {'title': 'Meals', 'image': Assets.assetsIconsMealIc},
    {'title': 'Search', 'image': Assets.assetsIconsSearch},
    {'title': 'Cart', 'image': Assets.assetsIconsCartIc},
    {'title': 'Profile', 'image': Assets.assetsIconsProfileIc},
  ];
  @override
  Widget build(BuildContext context) {
    return StylishBottomBar(
      backgroundColor: Colors.white,
      option: BubbleBarOptions(
        borderRadius: BorderRadius.circular(72),
        opacity: 1,
      ),
      items: items
          .map(
            (item) => BottomBarItem(
              backgroundColor: AppColors.darkPrimaryColor,
              icon: SizedBox(
                width: 20,
                child: Image.asset(
                  item['image']!,
                  color: selectedIndex.value == items.indexOf(item)
                      ? Colors.white
                      : AppColors.greyColor,
                ),
              ),
              title: Text(
                item['title']!,
                style: TextStyles.white14Medium,
              ),
            ),
          )
          .toList(),
      iconSpace: 1,
      currentIndex: selectedIndex.value,
      onTap: (index) {
        selectedIndex.value = index;
      },
    );
  }
}
