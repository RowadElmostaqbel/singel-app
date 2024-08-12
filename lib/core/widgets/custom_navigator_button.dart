import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_resturant_app/features/auth/presentation/manager/login_cubit.dart';

import '../utils/app_colors.dart';

class CustomNavigatorButton extends StatelessWidget {
  const CustomNavigatorButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.padding});
  final String title;
  final Function()? onPressed;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: padding),
          child: SizedBox(
            height: 56,
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: onPressed,
                child:state is LoginLoadingState? const CircularProgressIndicator(
                  color: Colors.white,
                ): Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
          ),
        );
      },
    );
  }
}
