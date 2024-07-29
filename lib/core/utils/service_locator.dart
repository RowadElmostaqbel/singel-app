import 'package:get_it/get_it.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';

abstract class ServiceLocatorHelper {
  static GetIt getIt = GetIt.instance;

  static void init() {
    getIt.registerSingleton<ApiService>(
      ApiService(),
    );
  }
}
