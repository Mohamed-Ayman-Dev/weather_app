import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/weather/data/datasources/weather_local_data_source.dart';
import '../../features/weather/data/datasources/weather_remote_data_source.dart';
import '../../features/weather/data/repositories/weather_repository.dart';
import '../../features/weather/data/repositories/weather_repository_impl.dart';
import '../../features/weather/presentation/providers/weather_provider.dart';
import '../cache/cache_helper.dart';
import '../network/api_client.dart';
import '../network/app_interceptors.dart';
import '../services/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupServices() async {
  /// register Cache
  final pref = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => pref);
  locator.registerLazySingleton<CacheHelper>(() => CacheHelper(locator()));

  /// register Navigation
  locator.registerLazySingleton<NavigationService>(() => NavigationService());

  /// register Network
  locator.registerLazySingleton<AppInterceptors>(() => AppInterceptors());

  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<ApiClient>(
    () => ApiClient(dio: locator(), appInterceptors: locator()),
  );

  /// register Data Sources
  locator.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(locator()),
  );

  locator.registerLazySingleton<WeatherLocalDataSource>(
    () => WeatherLocalDataSource(locator()),
  );

  /// register Repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  /// Providers
  locator.registerFactory<WeatherProvider>(() => WeatherProvider(locator()));
}
