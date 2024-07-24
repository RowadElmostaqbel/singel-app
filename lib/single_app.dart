import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:single_resturant_app/features/on_boarding/presentation/views/on_boarding_view.dart';


class SingleApp extends StatelessWidget {
  const SingleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        home: AnimatedSplashScreen(
          duration: 1500,
          splash: Image.asset('assets/images/logo.png'),
          splashIconSize: 100,
          nextScreen: const CheckoutView(),
          //const OnBoardingView(),
          backgroundColor: Colors.white,
        ));
  }
}
