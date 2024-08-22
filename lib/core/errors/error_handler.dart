import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/core/widgets/custom_toast_widget.dart';
import 'package:single_resturant_app/features/auth/presentation/views/login_view.dart';

abstract class ErrorHandler {
  static void handleError(
      {required Failure failure, required BuildContext context}) {
    if (failure.statusCode == 401) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        title: 'Login Required',
        titleTextStyle: TextStyles.black18SemiBold,
        desc: 'you need to Login in order to complete this action',
        padding: const EdgeInsets.symmetric(horizontal: 12),
        descTextStyle: TextStyles.black16Medium,
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          context.navigateTo(
            const LoginView(),
          );
        },
      ).show();
    } else {
      showTaost(
        failure.msg,
        Colors.redAccent,
      );
    }
  }
}
