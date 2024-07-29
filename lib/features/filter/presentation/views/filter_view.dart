import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/apply_and_cancel_filter_buttons.dart';
import '../widgets/custom_filttering_selection_list_view.dart';
import '../widgets/delivery_distance_slider_widget.dart';
import '../widgets/price_range_slider.dart';
class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomSheet: ApplyAndCancelFilterButtons(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Filter',
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(36),
                      CustomFilterringSelectionListView(
                        title: 'Food Type',
                        titles: [
                          'Burger',
                          'Burger',
                          'Burger',
                          'Burger',
                          'Burger',
                          'Burger',
                          'Burger',
                        ],
                      ),
                      Gap(32),
                      CustomFilterringSelectionListView(
                        title: 'Restaurant',
                        titles: [
                          'Burger King',
                          'Pizza Hut',
                          'Burger King',
                          'Pizza Hut',
                          'Burger King',
                          'Pizza Hut',
                          'Mac',
                        ],
                      ),
                      Gap(32),
                      CustomFilterringSelectionListView(
                        title: 'Delivery time',
                        titles: [
                          '10  Min',
                          '20  Min',
                          '28  Min',
                          '30  Min',
                          '36  Min',
                          '48  Min',
                          '60  Minac',
                        ],
                      ),
                      Gap(32),
                      DeliveryDistanceSliderWidget(),
                      Gap(32),
                      CustomFilterringSelectionListView(
                        title: 'Rating',
                        titles: [
                          '1 ⭐',
                          '2 ⭐',
                          '3 ⭐',
                          '4 ⭐',
                          '5 ⭐',
                        ],
                      ),
                      Gap(32),
                      PriceRangeSlider(),
                      Gap(100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
