import 'dart:async';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_result.dart';
import '../datasources/weather_local_data_source.dart';
import '../datasources/weather_remote_data_source.dart';
import '../models/weather_model.dart';
import 'weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required WeatherRemoteDataSource remoteDataSource,
    required WeatherLocalDataSource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  final WeatherRemoteDataSource _remoteDataSource;
  final WeatherLocalDataSource _localDataSource;

  @override
  Future<ApiResult<WeatherModel>> getCurrentWeather(String cityName) async {
    try {
      final weather = await _remoteDataSource.getCurrentWeather(cityName);
      // Cache the latest successful result without blocking the UI.
      _localDataSource.cacheWeather(weather);
      return ApiResult.success(weather);
    } on ApiException catch (e) {
      // Fall back to cached data only for network-related failures.
      if (e.shouldFallbackToCache) {
        final cachedWeather = await _localDataSource.getLastCachedWeather();
        if (cachedWeather != null) {
          return ApiResult.success(cachedWeather.copyWith(isFromCache: true));
        }
      }
      return ApiResult.failure(e);
    }
  }
}
