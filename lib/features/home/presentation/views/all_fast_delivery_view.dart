
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/widgets/custom_app_bar.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/fast_delivary_list_item.dart';

class AllFastDeliveryView extends StatelessWidget {
  const AllFastDeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              const CustomAppBar(title: 'Fast Delivery'),
              const Gap(36),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) => const FastDelivaryListItem(
                    fromShowAll: true,
                  ),
                  itemCount: 9,
                ),
              ),
              const Gap(36),
            ],
          ),
        ),
      ),
    );
  }
}
