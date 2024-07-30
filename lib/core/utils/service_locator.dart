import 'package:get_it/get_it.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/meal/data/repos/categories_repo.dart';
import 'package:single_resturant_app/features/meal/data/repos/categories_repo_impl.dart';

abstract class ServiceLocatorHelper {
  static GetIt getIt = GetIt.instance;

  static void init() {
    getIt.registerSingleton<ApiService>(
      ApiService(),
    );
    getIt.registerSingleton<CategoriesRepo>(
      CategoriesRepoImpl(
        apiService: getIt.get<ApiService>(),
      ),
    );
  }
}
