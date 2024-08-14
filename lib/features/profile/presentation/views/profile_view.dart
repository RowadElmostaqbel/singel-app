import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../auth/presentation/manager/user_cubit.dart';
import '../widgets/profile_photo_container.dart';
import '../widgets/log_out_container.dart';
import '../widgets/more_information_container.dart';
import '../widgets/my_account_container.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File? _image;
  final picker = ImagePicker();

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
                ProfilePhotoContainer(
                  onPressedGallery: () async {
                    var image =
                        await picker.pickImage(source: ImageSource.gallery);
                    _image = File(image!.path);
                    BlocProvider.of<UserCubit>(context).uploadImage(_image!);
                    // await BlocProvider.of<UserCubit>(context)
                    //     .addImage(_image!);
                  },
                  onPressedCamera: () async {
                    var image =
                        await picker.pickImage(source: ImageSource.camera);
                    _image = File(image!.path);
                    BlocProvider.of<UserCubit>(context).uploadImage(_image!);
                    // await BlocProvider.of<UserCubit>(context)
                    //     .addImage(_image!);
                  },
                ),
              ],
            ),
            expandedHeight: 250,
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
              child: Column(
                children: [
                  Text(
                    "Mohamed Ali",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Mohamed_ALi@gmail.com",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  MyAccountContainer(),
                  MoreInformationContainer(),
                  LogOutContainer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
