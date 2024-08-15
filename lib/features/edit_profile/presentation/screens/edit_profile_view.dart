import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/features/auth/data/models/user_model.dart';
import 'package:single_resturant_app/features/profile/presentation/widgets/edit_my_photo_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../profile/presentation/widgets/custom_photo_container.dart';
import '../widgets/edit_profile_text_form_field.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            leading: Align(
              alignment: const Alignment(1.5, 0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 15,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
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
                const EditMyPhotoWidget(),
              ],
            ),
            expandedHeight: 250,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
              child: Form(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    EditProfileTextFormField(
                      initialValue:
                          '${CacheServiceHeper().getData<UserModel>(boxName: 'user', key: 'user')?.data?.client?.name}',
                      prefixIcon:
                          Image.asset("assets/icons/profile/person.png"),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    EditProfileTextFormField(
                      initialValue:
                          '${CacheServiceHeper().getData<UserModel>(boxName: 'user', key: 'user')?.data?.client?.email}',
                      prefixIcon: Image.asset("assets/icons/profile/email.png"),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    EditProfileTextFormField(
                      initialValue:
                          '${CacheServiceHeper().getData<UserModel>(boxName: 'user', key: 'user')?.data?.client?.phone}',
                      prefixIcon: Image.asset("assets/icons/profile/phone.png"),
                    ),
                    const SizedBox(
                      height: 96,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        height: 56,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 56,
                              width: MediaQuery.sizeOf(context).width,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      )),
                                  onPressed: () {},
                                  child: const Text(
                                    "Save",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  )),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_outlined,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
