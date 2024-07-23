import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/widgets/custom_app_bar.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/offer_list_item.dart';

class AllOffersView extends StatelessWidget {
  const AllOffersView({super.key});

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
              const CustomAppBar(title: 'Offers'),
              const Gap(36),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    height: 225,
                    child: const OfferListITem(),
                  ),
                  separatorBuilder: (context, index) => const Gap(16),
                  itemCount: 8,
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
