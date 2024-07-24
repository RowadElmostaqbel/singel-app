import 'package:flutter/material.dart';

import 'nutrition_facts_list_item.dart';

class NutritionFactsListView extends StatelessWidget {
  const NutritionFactsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: const NutritionFactsListItem(),
          ),
        ),
      ),
    );
  }
}
