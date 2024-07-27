import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: Gap(
                        36,
                      ),
                    ),
                    SliverList.separated(
                      itemBuilder: (context, index) => Container(
                        height: 300,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: const OfferListITem(),
                      ),
                      separatorBuilder: (context, index) => const Gap(16),
                      itemCount: 8,
                    ),
                    const SliverToBoxAdapter(
                      child: Gap(
                        12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
