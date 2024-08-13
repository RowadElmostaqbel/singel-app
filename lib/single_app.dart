import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/core/utils/service_locator.dart';
import 'package:single_resturant_app/features/auth/data/models/user_model.dart';
import 'package:single_resturant_app/features/auth/data/repo/auth_repo.dart';
import 'package:single_resturant_app/features/auth/data/repo/login_repo.dart';
import 'package:single_resturant_app/features/bottom_nav/presentation/views/bottom_nav_view.dart';
import 'package:single_resturant_app/features/cart/data/repos/cart_repo.dart';
import 'package:single_resturant_app/features/meal/data/repos/categories_repo.dart';
import 'package:single_resturant_app/features/meal/presentation/controllers/categories_cubit.dart';
import 'package:single_resturant_app/features/my_address/presentation/manager/address_cubit.dart';
import 'package:single_resturant_app/features/on_boarding/presentation/views/on_boarding_view.dart';

import 'features/auth/presentation/manager/login_cubit.dart';
import 'features/auth/presentation/manager/user_cubit.dart';
import 'features/cart/presentation/controllers/cubit/cart_cubit.dart';
import 'features/my_address/data/repos/add_address_repo.dart';
import 'features/orders/presentation/controllers/order_animation/cubit/order_animation_cubit.dart';
import 'features/profile/presentation/views/profile_view.dart';

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
              ApiService(
                ServiceLocatorHelper.getIt.get<CacheServiceHeper>(),
              ),
            ),
            CacheServiceHeper(),
          ),
        ),
        BlocProvider(
          create: (context) => LoginCubit(
            LoginRepo(
              ApiService(
                ServiceLocatorHelper.getIt.get<CacheServiceHeper>(),
              ),
            ),
            CacheServiceHeper(),
          ),
        ),
        BlocProvider(
          create: (context) => CartCubit(
            ServiceLocatorHelper.getIt.get<CartRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => AddressCubit(AddAddressRepo(apiService: ApiService())),
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
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.white,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        home: AnimatedSplashScreen(
          duration: 1500,
          splash: Image.asset('assets/images/logo.png'),
          splashIconSize: 100,
          nextScreen: (CacheServiceHeper()
                          .getData<UserModel>(boxName: 'user', key: 'user')
                          ?.data
                          ?.token ??
                      '')
                  .isNotEmpty
              ? const BottomNavView()
              : const OnBoardingView(),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
