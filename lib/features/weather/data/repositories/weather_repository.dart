import '../../../../core/network/api_result.dart';
import '../models/weather_model.dart';

/// Contract the presentation layer depends on. Swapping the data source
/// (different API, GraphQL, mock for tests) only ever means writing a new
/// implementation of this — nothing in the provider or UI changes.
abstract class WeatherRepository {
  Future<ApiResult<WeatherModel>> getCurrentWeather(String cityName);
}