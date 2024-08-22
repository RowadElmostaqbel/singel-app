import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/wishlist/presentation/controllers/whishlist_cubit.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/whishlist_grid_view.dart';

class WishListView extends HookWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<WhishlistCubit>().fetchMyWishlist();
      return null;
    }, []);
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
        child: const whishlistGridView(),
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
