
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/features/profile/presentation/controllers/profile_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../auth/data/models/user_model.dart';
import '../widgets/custom_photo_container.dart';
import '../widgets/log_out_container.dart';
import '../widgets/more_information_container.dart';
import '../widgets/my_account_container.dart';

class ProfileView extends HookWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            leading: const SizedBox(),
            snap: false,
            pinned: false,
            floating: false,
            stretch: true,
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/images/profile_background.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const CustomPhotoContainer(),
              ],
            ),
            expandedHeight: 250,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Text(
                        CacheServiceHeper()
                                .getData<UserModel>(
                                    boxName: 'user', key: 'user')
                                ?.data
                                ?.client
                                ?.name ??
                            'Guest',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        CacheServiceHeper()
                                .getData<UserModel>(
                                    boxName: 'user', key: 'user')
                                ?.data
                                ?.client
                                ?.email ??
                            '',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGreyColor,
                        ),
                      ),
                      const MyAccountContainer(),
                      const MoreInformationContainer(),
                      if (CacheServiceHeper().getData<UserModel>(
                              boxName: 'user', key: 'user') ==
                          null)
                        const Gap(72),
                      if (CacheServiceHeper().getData<UserModel>(
                              boxName: 'user', key: 'user') !=
                          null)
                        const LogOutContainer(),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
