import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/wish_choice_list.dart';
import '../widgets/wish_item.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        height: context.height * .85,
        width: context.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) => WishItem(
            index: index,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .8,
            crossAxisCount: 2,
            crossAxisSpacing: 25,
            mainAxisSpacing: 20,
          ),
        ),
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            Positioned(
              top: -10,
              child: SizedBox(
                height: context.height * .3,
                width: context.width,
                child: Image.asset(
                  Assets.assetsImagesProfileBackground,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: CustomAppBar(
                  title: 'Wishlist',
                  style: TextStyles.white18SemiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
