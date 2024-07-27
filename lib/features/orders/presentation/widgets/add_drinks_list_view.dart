import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/text_styles.dart';
import 'add_drink_list_item.dart';

class AddDrinksListView extends StatelessWidget {
  const AddDrinksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add a drink',
          style: TextStyles.black18SemiBold,
        ),
        const Gap(16),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const AddDrinkListItem(),
            separatorBuilder: (context, index) => const Gap(16),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
