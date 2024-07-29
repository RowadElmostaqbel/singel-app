
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CustomFilterringSelectionListView extends HookWidget {
  final String title;
  final List<String> titles;
  const CustomFilterringSelectionListView({
    super.key,
    required this.title,
    required this.titles,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> isSelected = useState(-1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.black16SemiBold),
        const Gap(20),
        SizedBox(
          height: 42,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => isSelected.value == index
                ? SelectedFilterListItem(
                    title: titles[index],
                  )
                : GestureDetector(
                    onTap: () => isSelected.value = index,
                    child: UnSelectedFilterListItem(
                      title: titles[index],
                    ),
                  ),
            separatorBuilder: (context, index) => const Gap(12),
            itemCount: titles.length,
          ),
        ),
      ],
    );
  }
}

class SelectedFilterListItem extends StatelessWidget {
  final String title;

  const SelectedFilterListItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.primaryColor,
      ),
      child: Text(
        title,
        style: TextStyles.white14Medium,
      ),
    );
  }
}

class UnSelectedFilterListItem extends StatelessWidget {
  final String title;
  const UnSelectedFilterListItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xffF4F4F4),
      ),
      child: Text(
        title,
        style: TextStyles.black16Medium.copyWith(
          fontSize: 14,
        ),
      ),
    );
  }
}
