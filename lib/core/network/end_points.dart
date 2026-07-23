final class EndPoints {
  EndPoints._();

  /// Base URLs
  static const String baseUrl = "https://api.weatherapi.com/v1";
  static const String apiKey = '6f27a7b9512c4882a45162444252101';

  /// Weather
  static const String currentWeatherEndpoint = '/current.json';

  // static const String baseUrl = String.fromEnvironment('BASEURL');
}
