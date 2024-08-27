import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';
import 'package:single_resturant_app/features/auth/data/models/user_model.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/categories_list_view.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/offers_list_view.dart';
import 'package:single_resturant_app/features/home/presentation/widgets/select_address_dialog.dart';
import 'package:single_resturant_app/features/my_address/presentation/manager/address_cubit.dart';
import '../../../../core/utils/text_styles.dart';
import '../widgets/banners_view.dart';

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        leadingWidth: 70,
        actions: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              right: 10,
            ),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Text(
              'EN',
              style: TextStyles.primary18SemiBold.copyWith(fontSize: 14),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.brightGreyColor.withOpacity(.6),
            ),
            child: Image.asset(
              Assets.assetsIconsNotificationIc,
              fit: BoxFit.fill,
            ),
          ),
        ],
        leading: Row(
          children: [
            const Gap(10),
            Container(
              clipBehavior: Clip.antiAlias,
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImageWidget(
                                        isProfileImage: true,

                url: CacheServiceHeper()
                        .getData<UserModel>(boxName: 'user', key: 'user')
                        ?.data
                        ?.client
                        ?.image ??
                    '',
              ),
            ),
          ],
        ),
        // centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              CacheServiceHeper()
                      .getData<UserModel>(boxName: 'user', key: 'user')
                      ?.data
                      ?.client
                      ?.name ??
                  'Guest',
              style: TextStyles.black16SemiBold,
            ),
            const Gap(2),
            InkWell(
              onTap: () {
                showDialog(context: context, builder: (context)=> const SelectAddressDialog());
                // showDialog(
                //   context: context,
                //   builder: (context) => LocationView(
                //     buildContext: context,
                //   ),
                // );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: Image.asset(
                      Assets.assetsIconsLocationSolidIcon,
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: Text(
                      '${(context.watch<AddressCubit>().addresses.isNotEmpty) ? context.watch<AddressCubit>().addresses.first.details : 'No Address '}',
                      style: TextStyles.darkGrey14Regular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Gap(30),
            ),
            const SliverToBoxAdapter(
              child: BannersView(),
            ),
            const SliverToBoxAdapter(
              child: Gap(24),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: CategoriesListView(),
              ),
            ),
            // const SliverToBoxAdapter(
            //   child: Gap(24),
            // ),
            // const SliverToBoxAdapter(
            //   child: PopularMealsListView(),
            // ),
            const SliverToBoxAdapter(
              child: Gap(24),
            ),
            const SliverToBoxAdapter(
              child: OffersListVIew(),
            ),
            const SliverToBoxAdapter(
              child: Gap(24),
            ),
            SliverToBoxAdapter(
              child: Gap(context.height * .06),
            ),
          ],
        ),
      ),
    );
  }
}
