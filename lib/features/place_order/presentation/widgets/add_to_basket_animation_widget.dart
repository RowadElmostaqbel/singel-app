import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_resturant_app/features/place_order/presentation/controllers/order_animation/cubit/order_animation_cubit.dart';

import '../../../../core/utils/assets.dart';

class AddToBasketAnimationWidget extends StatefulWidget {
  const AddToBasketAnimationWidget({super.key});

  @override
  State<AddToBasketAnimationWidget> createState() =>
      _AddToBasketAnimationWidgetState();
}

class _AddToBasketAnimationWidgetState extends State<AddToBasketAnimationWidget>
    with TickerProviderStateMixin {
  late Tween<Offset> addToBasketAnimation;
  late AnimationController addintoBasketAnimationController;

  late Tween<double> hideItemsAnimation;
  late AnimationController hideItemsAnimationController;

  @override
  void initState() {
    super.initState();

    addintoBasketAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    hideItemsAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    addToBasketAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(
        200,
        250,
      ),
    );
    hideItemsAnimation = Tween<double>(begin: 1, end: 0);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 250), () {
      addintoBasketAnimationController.forward();
    });

    addintoBasketAnimationController.addListener(() {
      if (addintoBasketAnimationController.value >= .6) {
        hideItemsAnimationController.forward();
      }
      if (addintoBasketAnimationController.value == 1) {
       
          context.read<OrderAnimationCubit>().removeItemsFromAnimationList();
      
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: addintoBasketAnimationController,
      builder: (context, child) {
        return Transform.translate(
          offset: addToBasketAnimation.evaluate(
            CurvedAnimation(
              parent: addintoBasketAnimationController,
              curve: Curves.easeInOut,
            ),
          ),
          child: AnimatedBuilder(
            animation: hideItemsAnimationController,
            builder: (context, child) {
              return Transform.scale(
                scale: hideItemsAnimation.evaluate(
                  CurvedAnimation(
                    parent: hideItemsAnimationController,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    Assets.assetsImagesBurgerjfif,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    addintoBasketAnimationController.dispose();
    hideItemsAnimationController.dispose();
    super.dispose();
  }
}
