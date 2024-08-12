
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../cart/presentation/controllers/cubit/cart_cubit.dart';
import '../../../meal/data/models/meal_model.dart';
import 'add_side_list_item.dart';

class AddSidesListView extends HookWidget {
  final List<SideItemModel> sideItems;

  const AddSidesListView({
    super.key,
    required this.sideItems,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<SideItemModel>> sides = useState([]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add a side',
          style: TextStyles.black18SemiBold,
        ),
        const Gap(16),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                if (sides.value.contains(sideItems[index])) {
                  sides.value.remove(sideItems[index]);
                } else {
                  sides.value.add(sideItems[index]);
                }
                sides.value = sides.value.toSet().toList();
             
              },
              child: AddSideListItem(
                isSelected: sides.value.contains(sideItems[index]),
                sideItemModel: sideItems[index],
              ),
            ),
            separatorBuilder: (context, index) => const Gap(16),
            itemCount: sideItems.length,
          ),
        ),
      ],
    );
  }
}
