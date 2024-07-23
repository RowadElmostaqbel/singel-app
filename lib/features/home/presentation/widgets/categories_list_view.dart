

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/features/home/presentation/views/category_view.dart';

class CategoriesListView extends HookWidget {
  static List<Map<String, String>> items = [
    {
      'title': 'All',
      'image': Assets.assetsImagesAll,
    },
    {
      'title': 'Burger',
      'image': Assets.assetsImagesBurger,
    },
    {
      'title': 'Pizza',
      'image': Assets.assetsImagesPizza,
    },
    {
      'title': 'Pasta',
      'image': Assets.assetsImagesPasta,
    },
    {
      'title': 'Salad',
      'image': Assets.assetsImagesSalad,
    },
    {
      'title': 'Salad',
      'image': Assets.assetsImagesSalad,
    },
  ];
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> index = useState(0);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items
            .map((item) => index.value == items.indexOf(item)
                ? GestureDetector(
                    onTap: () => context.navigateTo(
                      CategoryView(
                        title: item['title']!,
                      ),
                    ),
                    child: SelectedCategoryListItem(
                        title: item['title']!, image: item['image']!),
                  )
                : GestureDetector(
                    onTap: () {
                      index.value = items.indexOf(item);
                      context.navigateTo(
                        CategoryView(
                          title: item['title']!,
                        ),
                      );
                    },
                    child: UnSelectedCategoryListItem(
                        title: item['title']!, image: item['image']!),
                  ))
            .toList(),
      ),
    );
  }
}

class SelectedCategoryListItem extends StatelessWidget {
  final String title;
  final String image;
  const SelectedCategoryListItem({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 64,
            width: 64,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.primaryColor,
            ),
            child: Image.asset(image),
          ),
          const Gap(8),
          Text(
            title,
            style: TextStyles.primary14Medium,
          )
        ],
      ),
    );
  }
}

class UnSelectedCategoryListItem extends StatelessWidget {
  final String title;
  final String image;
  const UnSelectedCategoryListItem({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 64,
            width: 64,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xffF4F4F4),
            ),
            child: Image.asset(image),
          ),
          const Gap(8),
          Text(
            title,
            style: TextStyles.darkGrey14Regular,
          )
        ],
      ),
    );
  }
}
