import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/auth/data/models/user_model.dart';
import 'package:single_resturant_app/features/auth/presentation/manager/user_cubit.dart';
import 'package:single_resturant_app/features/auth/presentation/views/login_view.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constants.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Stack(children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.15,
              width: MediaQuery.sizeOf(context).width * 0.825,
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 16, left: 76, right: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Are you want to logout?",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(
                                          color: AppColors.primaryColor))),
                              onPressed: () {
                                context.pop();
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryColor,
                                  fontSize: 20,
                                ),
                              )),
                          BlocConsumer<UserCubit, UserState>(
                            listener: (context, state) {
                              if (state is AuthLoadedState) {
                                try {
                                  Hive.box<UserModel>('user').clear();
                                  Hive.box<UserModel>('remember_me').clear();
                                  Hive.box<UserModel>(Constants.recentQueryBox)
                                      .clear();
                                } catch (e) {
                                  log(name: 'error', e.toString());
                                }
                                context.navigateToReplacement(
                                  const LoginView(),
                                );
                              }
                            },
                            builder: (context, state) {
                              return SizedBox(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        )),
                                    onPressed: () {
                                      context.read<UserCubit>().logout();
                                    },
                                    child: state is AuthLoadingState
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : const Text(
                                            "logout",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          )),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: context.height * .365,
          left: 50,
          child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  color: AppColors.primaryColor, shape: BoxShape.circle),
              child: Image.asset("assets/icons/logout.png")),
        ),
        Positioned(
          top: context.height * .475,
          left: 35,
          child: Image.asset("assets/images/dialog_decoration.png"),
        ),
      ]),
    );
  }
}
