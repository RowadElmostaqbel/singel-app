import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/service_locator.dart';
import 'package:single_resturant_app/single_app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 ServiceLocatorHelper.init();
  runApp(const SingleApp());
}


