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
import 'package:single_resturant_app/features/checkout/data/repo/checkout_repo.dart';
import 'package:single_resturant_app/features/checkout/presentation/controllers/checkout_cubit.dart';
import 'package:single_resturant_app/features/meal/presentation/controllers/categories_cubit.dart';
import 'package:single_resturant_app/features/my_address/presentation/manager/address_cubit.dart';
import 'package:single_resturant_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:single_resturant_app/features/orders/data/repo/order_repo.dart';
import 'package:single_resturant_app/features/orders/presentation/controllers/order/cancel_order_cubit.dart';
import 'package:single_resturant_app/features/orders/presentation/controllers/order/orders_cubit.dart';
import 'package:single_resturant_app/features/profile/data/repo/edit_profile_repo.dart';
import 'package:single_resturant_app/features/profile/presentation/controllers/profile_cubit.dart';
import 'package:single_resturant_app/features/wishlist/data/repo/whishlist_repo.dart';
import 'package:single_resturant_app/features/wishlist/presentation/controllers/whishlist_cubit.dart';

import 'features/auth/presentation/manager/login_cubit.dart';
import 'features/auth/presentation/manager/user_cubit.dart';
import 'features/cart/presentation/controllers/cubit/cart_cubit.dart';
import 'features/my_address/data/repos/addressess_repo.dart';
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
          create: (context) => AddressCubit(
            AddressRepo(
              apiService: ServiceLocatorHelper.getIt.get<ApiService>(),
            ),
          )..fetchMyAddresses(),
        ),
        BlocProvider(
          create: (context) =>
              ServiceLocatorHelper.getIt.get<CategoriesCubit>(),
        ),
        BlocProvider(
          create: (context) => CheckoutCubit(
            ServiceLocatorHelper.getIt.get<CheckoutRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(
            ServiceLocatorHelper.getIt.get<EditProfileRepo>(),
            ServiceLocatorHelper.getIt.get<CacheServiceHeper>(),
          ),
        ),
        BlocProvider(
          create: (context) => WhishlistCubit(
            ServiceLocatorHelper.getIt.get<WhishlistRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => OrdersCubit(
            ServiceLocatorHelper.getIt.get<OrderRepo>(),
          ),
        ),
         BlocProvider(
          lazy: false,
          create: (context) => CancelOrderCubit(
            ServiceLocatorHelper.getIt.get<OrderRepo>(),
          )..fetchCancelReasons(),
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
          nextScreen: ((CacheServiceHeper()
                              .getData<UserModel>(boxName: 'user', key: 'user')
                              ?.data
                              ?.token ??
                          '')
                      .isNotEmpty &&
                  (CacheServiceHeper().getData<bool>(
                          boxName: 'remember_me', key: 'remember_me') ??
                      false))
              ? const BottomNavView()
              : const OnBoardingView(),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
