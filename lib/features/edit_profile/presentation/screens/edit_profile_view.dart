import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/features/auth/data/models/user_model.dart';
import 'package:single_resturant_app/features/profile/presentation/widgets/edit_my_photo_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_toast_widget.dart';
import '../../../profile/presentation/controllers/profile_cubit.dart';
import '../../../profile/presentation/widgets/custom_photo_container.dart';
import '../widgets/edit_profile_text_form_field.dart';

class EditProfileView extends HookWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userName = useTextEditingController();
    TextEditingController email = useTextEditingController();
    TextEditingController phone = useTextEditingController();
    TextEditingController password = useTextEditingController();
    useEffect(() {
      context.read<ProfileCubit>().resetUpdateDataMap();
      return null;
    }, []);
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
                      dataKey: 'name',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    EditProfileTextFormField(
                      initialValue:
                          '${CacheServiceHeper().getData<UserModel>(boxName: 'user', key: 'user')?.data?.client?.email}',
                      prefixIcon: Image.asset("assets/icons/profile/email.png"),
                      dataKey: 'email',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    EditProfileTextFormField(
                      initialValue:
                          '${CacheServiceHeper().getData<UserModel>(boxName: 'user', key: 'user')?.data?.client?.phone}',
                      prefixIcon: Image.asset("assets/icons/profile/phone.png"),
                      dataKey: 'phone',
                    ),
                    const SizedBox(
                      height: 96,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: BlocConsumer<ProfileCubit, ProfileState>(
                        listener: (context, state) {
                          if (state is EditProfileFailureState) {
                            showTaost(state.error, Colors.redAccent);
                          } else if (state is EditProfileSuccessState) {
                            showTaost('Profile Updated', Colors.greenAccent);
                          }
                        },
                        builder: (context, state) {
                          return SizedBox(
                            height: 56,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 56,
                                  width: MediaQuery.sizeOf(context).width,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          )),
                                      onPressed: () {
                                        context
                                            .read<ProfileCubit>()
                                            .updateProfile();
                                      },
                                      child: state is EditProfileLoadingState
                                          ? const Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            )
                                          : const Text(
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
                          );
                        },
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
