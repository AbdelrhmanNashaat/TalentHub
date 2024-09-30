import 'package:get_it/get_it.dart';

import '../database/cache_helper.dart';

final GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
}
