import 'package:flutter/foundation.dart';

import '../../data/repositories/weather_repository.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherProvider(this._repository);

  final WeatherRepository _repository;

  // WeatherViewState _state = WeatherViewState.idle;
  // WeatherOldModel? _weather;
  // String? _errorMessage;
  //
  // WeatherViewState get state => _state;
  // WeatherOldModel? get weather => _weather;
  // String? get errorMessage => _errorMessage;
  //
  // Future<void> searchCity(String rawCityName) async {
  //   final cityName = rawCityName.trim();
  //
  //   if (cityName.isEmpty) {
  //     _state = WeatherViewState.error;
  //     _errorMessage = 'Please enter a city name.';
  //     notifyListeners();
  //     return;
  //   }
  //
  //   _state = WeatherViewState.loading;
  //   _errorMessage = null;
  //   notifyListeners();
  //
  //   final result = await _repository.getWeatherForCity(cityName);
  //
  //   switch (result) {
  //     case ApiSuccess<WeatherOldModel>(:final data):
  //       _weather = data;
  //       _state = WeatherViewState.success;
  //     case ApiFailure<WeatherOldModel>(:final message):
  //       _errorMessage = message;
  //       _state = WeatherViewState.error;
  //   }
  //
  //   notifyListeners();
  // }
}
