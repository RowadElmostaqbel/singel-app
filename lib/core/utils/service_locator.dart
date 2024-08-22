import 'package:get_it/get_it.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/features/cart/data/repos/cart_repo.dart';
import 'package:single_resturant_app/features/cart/data/repos/cart_repo_impl.dart';
import 'package:single_resturant_app/features/checkout/data/repo/checkout_repo.dart';
import 'package:single_resturant_app/features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:single_resturant_app/features/meal/data/repos/categories_repo.dart';
import 'package:single_resturant_app/features/meal/data/repos/categories_repo_impl.dart';
import 'package:single_resturant_app/features/meal/presentation/controllers/categories_cubit.dart';
import 'package:single_resturant_app/features/orders/data/repo/order_repo.dart';
import 'package:single_resturant_app/features/orders/data/repo/order_repo_impl.dart';
import 'package:single_resturant_app/features/profile/data/repo/edit_profile_repo.dart';
import 'package:single_resturant_app/features/profile/data/repo/edit_profile_repo_impl.dart';
import 'package:single_resturant_app/features/review/data/repos/review_repo.dart';
import 'package:single_resturant_app/features/review/data/repos/review_repo_impl.dart';
import 'package:single_resturant_app/features/wishlist/data/repo/whishlist_repo.dart';
import 'package:single_resturant_app/features/wishlist/data/repo/whishlist_repo_impl.dart';

abstract class ServiceLocatorHelper {
  static GetIt getIt = GetIt.instance;

  static void init() {
    getIt.registerSingleton<CacheServiceHeper>(
      CacheServiceHeper(),
    );
    getIt.registerSingleton<ApiService>(
      ApiService(
        getIt.get<CacheServiceHeper>(),
      ),
    );
    getIt.registerSingleton<CategoriesRepo>(
      CategoriesRepoImpl(
        apiService: getIt.get<ApiService>(),
      ),
    );
    getIt.registerSingleton<CartRepo>(
      CartRepoImpl(
        apiService: getIt.get<ApiService>(),
      ),
    );

    getIt.registerSingleton<CheckoutRepo>(
      CheckoutRepoImpl(
        apiService: getIt.get<ApiService>(),
      ),
    );
    getIt.registerSingleton<EditProfileRepo>(
      EditProfileRepoImpl(
        apiService: getIt.get<ApiService>(),
      ),
    );
    getIt.registerSingleton<CategoriesCubit>(
      CategoriesCubit(
        getIt.get<CategoriesRepo>(),
      ),
    );
    getIt.registerSingleton<WhishlistRepo>(
      WhishlistRepoImpl(
      apiService:   getIt.get<ApiService>(),
      ),
    );
    getIt.registerSingleton<OrderRepo>(
      OrderRepoImpl(
      apiService:   getIt.get<ApiService>(),
      ),
    );
     getIt.registerSingleton<ReviewRepo>(
      ReviewRepoImpl(
      apiService:   getIt.get<ApiService>(),
      ),
    );
  }
}
