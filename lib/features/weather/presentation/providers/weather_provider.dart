import 'package:flutter/material.dart';

import '../../data/models/weather_model.dart';
import '../../data/repositories/weather_repository.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherProvider(this._repository);

  final WeatherRepository _repository;

  bool isLoading = false;
  WeatherModel? weather;
  String? errorMessage;

  Future<void> searchCity(String cityName) async {
    final city = cityName.trim();
    // Validate the user input before making the API request.
    if (city.isEmpty) {
      errorMessage = 'Please enter a city name.';
      notifyListeners();
      return;
    }
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repository.getCurrentWeather(city);
    // Update the UI based on the repository result.
    result.when(
      success: (weatherData) {
        weather = weatherData;
      },
      failure: (error) {
        weather = null;
        errorMessage = error.message;
      },
    );
    isLoading = false;
    notifyListeners();
  }

  void clear() {
    weather = null;
    errorMessage = null;
    notifyListeners();
  }
}
