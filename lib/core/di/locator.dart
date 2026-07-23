
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cache/cache_helper.dart';
import '../services/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupServices() async {
  /// register cache
  final pref = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => pref);
  locator.registerLazySingleton<CacheHelper>(() => CacheHelper(locator()));
  /// register services
  locator.registerLazySingleton<NavigationService>(() => NavigationService());

  /// register providers

}
