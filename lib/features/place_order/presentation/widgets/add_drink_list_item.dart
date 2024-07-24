

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';

class AddDrinkListItem extends StatelessWidget {
  const AddDrinkListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: const Color(
            0xffF4F3F3,
          ),
        ),
      ),
      child: Row(
        children: [
          Image.asset(Assets.assetsImagesPepsi),
          const Gap(4),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 100,
                ),
                child: const Text(
                  'Cocacola coke',
                  maxLines: 2,
                  style: TextStyles.darkGrey14Regular,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Text(
                '15 EL',
                style: TextStyles.primary14Regular,
              )
            ],
          ),
        ],
      ),
    );
  }
}
