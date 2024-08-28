
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/features/orders/presentation/widgets/add_or_remove_btn.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../meal/data/models/meal_model.dart';

class IngredientListItem extends StatelessWidget {
  final IngredientsModel  ingredient;
  const IngredientListItem({
    super.key, required this.ingredient,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 60,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(4),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: const Color(
                      0xffF4F3F3,
                    ),
                  ),
                ),
                child: Image.asset(ingredient.img),
              ),
              const Align(
                alignment: AlignmentDirectional.topEnd,
                child: AddOrRemoveBtn(),
              ),
            ],
          ),
        ),
        const Gap(8),
         Text(
         ingredient.name,
          style: TextStyles.darkGrey14Regular,
        ),
      ],
    );
  }
}
