import 'dart:async';

import '../datasources/weather_local_data_source.dart';
import '../datasources/weather_remote_data_source.dart';
import '../models/weather_model.dart';


class WeatherRepository  {
  WeatherRepository({
    required WeatherRemoteDataSource remoteDataSource,
    required WeatherLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final WeatherRemoteDataSource _remoteDataSource;
  final WeatherLocalDataSource _localDataSource;

  // Future<ApiResult<WeatherModel>> getWeatherForCity(String cityName) async {
  //   try {
  //     final weather = await _remoteDataSource.fetchCurrentWeather(cityName);
  //
  //     // Fire-and-forget: caching failures shouldn't block a successful lookup.
  //     unawaited(_localDataSource.cacheWeather(weather));
  //
  //     return ApiSuccess(weather);
  //   } on WeatherApiException catch (e) {
  //     final cached = await _localDataSource.getLastCachedWeather();
  //     if (cached != null) {
  //       // Network/API failed, but we have something to show — surface it
  //       // as a success flagged `isFromCache` so the UI can tell the user.
  //       return ApiSuccess(cached.copyWith(isFromCache: true));
  //     }
  //     return ApiFailure(e.message);
  //   } catch (_) {
  //     final cached = await _localDataSource.getLastCachedWeather();
  //     if (cached != null) {
  //       return ApiSuccess(cached.copyWith(isFromCache: true));
  //     }
  //     return const ApiFailure('Unexpected error while fetching the weather.');
  //   }
  // }
}
