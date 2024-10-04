import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hire_me/core/services/fire_base_services.dart';

import '../database/cache_helper.dart';
import '../database/shared_preferences_keys.dart';

final GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FireBaseServices>(() => FireBaseServices());
  getIt.registerLazySingleton<SharedPreferencesKeys>(
      () => SharedPreferencesKeys());
}
