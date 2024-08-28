
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../meal/data/models/meal_model.dart';

class AddSideListItem extends StatelessWidget {
  final bool isSelected;
  final SideItemModel sideItemModel;
  const AddSideListItem({
    super.key,
    required this.sideItemModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.white,
        border: Border.all(
          width: 2,
          color: isSelected
              ? AppColors.darkPrimaryColor
              : const Color(
                  0xffF4F3F3,
                ),
        ),
      ),
      child: Row(
        children: [
          Image.asset(sideItemModel.img),
          const Gap(4),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 100,
                ),
                child: Text(
                  sideItemModel.name,
                  maxLines: 2,
                  style: TextStyles.darkGrey14Regular
                      .copyWith(color: isSelected ? Colors.white : null),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${sideItemModel.price} EL',
                style: TextStyles.primary14Regular
                    .copyWith(color: isSelected ? Colors.white : null),
              )
            ],
          ),
        ],
      ),
    );
  }
}
