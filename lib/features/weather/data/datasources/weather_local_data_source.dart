
import '../../../../core/cache/cache_helper.dart';
import '../models/weather_model.dart';

/// Reads/writes the last successfully fetched weather result via the
/// shared [CacheHelper]. Only knows about storage — the repository decides
/// when to call it and what "isFromCache" means for the UI.
abstract class WeatherLocalDataSource {
  // Future<void> cacheWeather(WeatherModel weather);
  // Future<WeatherModel?> getLastCachedWeather();
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  WeatherLocalDataSourceImpl(this._cacheHelper);

  final CacheHelper _cacheHelper;

  static const _cacheKey = 'last_weather_result';

  @override
  Future<void> cacheWeather(WeatherModel weather) async {
    // CacheHelper only stores primitives, so the model is JSON-encoded
    // to a string before saving.
    // await _cacheHelper.saveData(
    //   key: _cacheKey,
    //   value: jsonEncode(weather.toCacheJson()),
    // );
  }
  //
  // @override
  // Future<WeatherModel?> getLastCachedWeather() async {
  //   final raw = _cacheHelper.getData(key: _cacheKey) as String?;
  //   if (raw == null) return null;
  //
  //   try {
  //     return WeatherModel.fromCacheJson(jsonDecode(raw) as Map<String, dynamic>);
  //   } catch (_) {
  //     // Corrupted cache entry — treat as no cache rather than crashing.
  //     return null;
  //   }
  // }
}
