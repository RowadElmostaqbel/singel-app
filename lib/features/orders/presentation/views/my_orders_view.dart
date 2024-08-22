import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/orders/presentation/views/orders_history_view.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../home/presentation/views/category_view.dart';
import '../controllers/order/orders_cubit.dart';
import 'active_order_view.dart';

class MyOrdersView extends HookWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<OrdersCubit>().fetchMyOrders();
      return null;
    }, []);
    final PageController pageController = usePageController(initialPage: 0);
    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsets.all(24),
        height: context.height * .85,
        width: context.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTabBar(
              pageController,
              titles: const [
                'Active',
                'History',
                'Canceled',
              ],
            ),
            const Gap(14),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: const [
                  ActiveOrdersView(),
                  OrdersHistoryView(),
                  OrdersHistoryView(),
                ],
              ),
            )
          ],
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
                  title: 'My Orders',
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
