import '../../../../core/network/api_client.dart';
import '../../../../core/network/end_points.dart';
import '../models/weather_model.dart';

/// Defines the contract for fetching weather data from the remote API.
abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response = await _apiClient.get(
      EndPoints.currentWeather,
      queryParameters: {'key': EndPoints.apiKey, 'q': cityName},
    );
    return WeatherModel.fromApiJson(response.responseData);
  }
}
