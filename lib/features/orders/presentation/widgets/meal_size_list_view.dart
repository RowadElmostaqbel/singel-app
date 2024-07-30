import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class MealSizeListView extends HookWidget {
  static List<String> sizes = ['Small', 'Medium', 'Large'];
  const MealSizeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> selectedIndex = useState(-1);
    return Row(
      children: sizes
          .map(
            (size) => selectedIndex.value == sizes.indexOf(size)
                ? Expanded(
                    child: SelectedSizeListItem(
                      title: size,
                    ),
                  )
                : Expanded(
                    child: GestureDetector(
                      onTap: () => selectedIndex.value = sizes.indexOf(size),
                      child: UnSelectedSizeListItem(
                        title: size,
                      ),
                    ),
                  ),
          )
          .toList(),
    );
  }
}

class SelectedSizeListItem extends StatelessWidget {
  final String title;
  const SelectedSizeListItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          alignment: Alignment.center,
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Text(
            title,
            style: TextStyles.white16SemiBold,
          ),
        ),
        const Gap(10),
        const Text(
          '60.00 EL',
          style: TextStyles.black16SemiBold,
        ),
      ],
    );
  }
}

class UnSelectedSizeListItem extends StatelessWidget {
  final String title;
  const UnSelectedSizeListItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          alignment: Alignment.center,
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: const Color(0xffF4F4F4),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Text(
            title,
            style: TextStyles.black16SemiBold,
          ),
        ),
        const Gap(10),
        const Text(
          '60.00 EL',
          style: TextStyles.black16Medium,
        ),
      ],
    );
  }
}
