import '../models/weather_model.dart';

/// Talks to the network and returns a parsed [WeatherModel]. Doesn't know
/// about caching, fallback behavior, or [ApiResult] — that orchestration
/// lives one level up in the repository. This layer's only job is
/// "get me this city's weather, or throw."
abstract class WeatherRemoteDataSource {
  // Future<WeatherModel> fetchCurrentWeather(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  // WeatherRemoteDataSourceImpl(this._apiClient);
  //
  // final WeatherApiClient _apiClient;

  // @override
  // Future<WeatherModel> fetchCurrentWeather(String cityName) async {
  //   // Throws WeatherApiException on failure — left uncaught here on purpose,
  //   // the repository decides whether to fall back to cache or surface it.
  //   final json = await _apiClient.fetchCurrentWeather(cityName);
  //   return WeatherModel.fromApiJson(json);
  // }
}
