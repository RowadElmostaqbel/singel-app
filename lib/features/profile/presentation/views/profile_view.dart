import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../auth/data/models/user_model.dart';
import '../widgets/custom_photo_container.dart';
import '../widgets/log_out_container.dart';
import '../widgets/more_information_container.dart';
import '../widgets/my_account_container.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
              child: Column(
                children: [
                  Text(
                    '${CacheServiceHeper().getData<UserModel>(boxName: 'user', key: 'user')?.data?.client?.name}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${CacheServiceHeper().getData<UserModel>(boxName: 'user', key: 'user')?.data?.client?.email}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  const MyAccountContainer(),
                  const MoreInformationContainer(),
                  const LogOutContainer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
