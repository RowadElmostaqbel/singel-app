import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/features/bottom_nav/presentation/widgets/custom_nav_bar.dart';
import 'package:single_resturant_app/features/cart/presentation/views/cart_view.dart';
import 'package:single_resturant_app/features/orders/presentation/views/my_orders_view.dart';

import '../../../home/presentation/views/home_view.dart';

class BottomNavView extends HookWidget {
  const BottomNavView({super.key});
  static List<Widget> screens = [
    const HomeView(),
    Container(),
    Container(),
    const CartView(),
    const MyOrdersView(),
  ];
  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> selectedIndex = useState(0);

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
      ),
      body: screens[selectedIndex.value],
    );
  }
}
