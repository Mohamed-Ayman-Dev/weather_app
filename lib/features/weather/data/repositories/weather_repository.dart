import '../../../../core/network/api_result.dart';
import '../models/weather_model.dart';

/// Defines the contract for retrieving weather data.

abstract class WeatherRepository {
  Future<ApiResult<WeatherModel>> getCurrentWeather(String cityName);
}
