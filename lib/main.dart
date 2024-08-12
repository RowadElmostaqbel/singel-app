import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_resturant_app/core/utils/bloc_observer.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/core/utils/service_locator.dart';
import 'package:single_resturant_app/single_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocatorHelper.init();
  Bloc.observer = MyBlocObserver();
  CacheServiceHeper.initCaching();
  runApp(const SingleApp());
}
