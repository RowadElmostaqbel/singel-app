import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/service_locator.dart';
import 'package:single_resturant_app/features/auth/data/repo/auth_repo.dart';
import 'package:single_resturant_app/features/auth/data/repo/login_repo.dart';
import 'package:single_resturant_app/features/meal/data/repos/categories_repo.dart';
import 'package:single_resturant_app/features/meal/presentation/controllers/categories_cubit.dart';
import 'package:single_resturant_app/features/my_address/presentation/manager/address_cubit.dart';
import 'package:single_resturant_app/features/on_boarding/presentation/views/on_boarding_view.dart';

import 'features/auth/presentation/manager/login_cubit.dart';
import 'features/auth/presentation/manager/user_cubit.dart';
import 'features/cart/presentation/controllers/cubit/cart_cubit.dart';
import 'features/orders/presentation/controllers/order_animation/cubit/order_animation_cubit.dart';

class SingleApp extends StatelessWidget {
  const SingleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OrderAnimationCubit(),
        ),
        BlocProvider(
          create: (context) => UserCubit(
            AuthRepo(
              ApiService(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => LoginCubit(LoginRepo(ApiService())),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
          BlocProvider(
          create: (context) => AddressCubit(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(
            ServiceLocatorHelper.getIt.get<CategoriesRepo>(),
          ),
        ),
      ],
      child: MaterialApp(
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
            nextScreen: const OnBoardingView(),
            backgroundColor: Colors.white,
          )),
    );
  }
}
