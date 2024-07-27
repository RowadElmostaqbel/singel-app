import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../../../../core/utils/assets.dart';
import '../controllers/order_animation/cubit/order_animation_cubit.dart';

class AnimatedBasketWidget extends StatefulWidget {
  const AnimatedBasketWidget({
    super.key,
  });

  @override
  State<AnimatedBasketWidget> createState() => _AnimatedBasketWidgetState();
}

class _AnimatedBasketWidgetState extends State<AnimatedBasketWidget>
    with TickerProviderStateMixin {
  late Tween<double> scaleAnimation;
  late Tween<Offset> removeBasketAnimation;
  late AnimationController basketAnimationController;
  late AnimationController removeBasketAnimationController;

  @override
  void initState() {
    super.initState();

    basketAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    removeBasketAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    scaleAnimation = Tween<double>(begin: 0, end: 1);

    // Initializing the removeBasketAnimation properly
    removeBasketAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1500, 0.0),
    );

    // removeBasketAnimationController.addListener(() {
    //   if (removeBasketAnimationController.value == 1) {
    //     basketAnimationController.reset();
    //   }
    // });
  }

  @override
  void dispose() {
    basketAnimationController.dispose();
    removeBasketAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderAnimationCubit, OrderAnimationState>(
      listener: (context, state) {
        if (state is RemovingOrderAnimationState ) {
          log('message');

          Future.delayed(const Duration(milliseconds: 500), () {
            removeBasketAnimationController.reset();
            removeBasketAnimationController.forward();
          });
        } else if (state is AddingOrderAnimationState ) {
          removeBasketAnimationController.reset();
          basketAnimationController.reset();
          log(name: 'controller', '${basketAnimationController.value}');
          log(name: 'scale', '$scaleAnimation');
          log(name: 'offset', '$removeBasketAnimation');

          basketAnimationController.forward();
        }
      },
      child: BlocBuilder<OrderAnimationCubit, OrderAnimationState>(
        builder: (context, state) {
          return Positioned(
            top: context.height * .2,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: Listenable.merge([
                basketAnimationController,
                removeBasketAnimationController,
              ]),
              builder: (context, child) {
                return Transform.scale(
                  scale: scaleAnimation.evaluate(CurvedAnimation(
                    parent: basketAnimationController,
                    curve: Curves.bounceInOut,
                  )),
                  child: Transform.translate(
                    offset: removeBasketAnimation.evaluate(CurvedAnimation(
                      parent: removeBasketAnimationController,
                      curve: Curves.bounceInOut,
                    )),
                    child: Image.asset(
                      Assets.assetsImagesBasket,
                      height: context.height * .25,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
