import 'package:hive_flutter/hive_flutter.dart';
import 'package:single_resturant_app/core/utils/constants.dart';
import 'package:single_resturant_app/features/auth/data/models/client.dart';
import 'package:single_resturant_app/features/auth/data/models/data.dart';
import 'package:single_resturant_app/features/auth/data/models/user_model.dart';

class CacheServiceHeper {
  static initCaching() async {
    await Hive.initFlutter();

    Hive.registerAdapter(ClientAdapter());
    Hive.registerAdapter(DataAdapter());
    Hive.registerAdapter(UserModelAdapter());
    await Hive.openBox<UserModel>('user');
    await Hive.openBox<bool>('remember_me');
    await Hive.openBox<List<String>>(Constants.recentQueryBox);
  }

  storeData<T>(
      {required T data, required String boxName, required String key}) {
    Hive.box<T>(boxName).put(key, data);
  }

 T? getData<T>({required String boxName, required String key}) {
    return Hive.box<T>(boxName).get(key);
  }
}
