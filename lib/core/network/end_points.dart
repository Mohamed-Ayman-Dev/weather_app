final class EndPoints {
  EndPoints._();

  /// Base URLs
  static const String baseUrl = "https://api.weatherapi.com/v1";

  /// In production, sensitive API keys should be stored on a backend.
  /// Build-time configuration (e.g. `String.fromEnvironment`) can be
  /// used to keep configuration out of source control, but it does not
  /// make client-side API keys secret.
  static const String apiKey = '6f27a7b9512c4882a45162444252101';
  /// Weather
  static const String currentWeather = '/current.json';

}

// static const String baseUrl = String.fromEnvironment('BASEURL');
// static const String apiKey = String.fromEnvironment('API_KEY');


