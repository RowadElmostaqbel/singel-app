import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/features/bottom_nav/presentation/widgets/custom_nav_bar.dart';

import '../../../home/presentation/views/home_view.dart';

class BottomNavView extends HookWidget {
  const BottomNavView({super.key});
  static List<Widget> screens = [
    const HomeView(),
    Container(),
    Container(),
    Container(),
    Container(),
    // const CartView(),
    // const ProfileView(),
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
