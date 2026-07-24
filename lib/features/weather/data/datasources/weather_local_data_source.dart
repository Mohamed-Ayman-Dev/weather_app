import 'dart:convert';

import 'package:weather_app/core/constants/app_constant.dart';

import '../../../../core/cache/cache_helper.dart';
import '../models/weather_model.dart';

/// Handles caching of the last successful weather response using [CacheHelper].
///
/// The repository decides when cached data should be used.
class WeatherLocalDataSource {
  WeatherLocalDataSource(this._cacheHelper);

  final CacheHelper _cacheHelper;

  Future<void> cacheWeather(WeatherModel weather) async {
    // CacheHelper only stores primitives, so the model is JSON-encoded
    // to a string before saving.
    await _cacheHelper.saveData(
      key: AppConstant.cacheKey,
      value: jsonEncode(weather.toCacheJson()),
    );
  }

  Future<WeatherModel?> getLastCachedWeather() async {
    final raw = _cacheHelper.getData(key: AppConstant.cacheKey) as String?;
    if (raw == null) return null;

    try {
      return WeatherModel.fromCacheJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (_) {
      // Corrupted cache entry — treat as no cache rather than crashing.
      return null;
    }
  }
}
