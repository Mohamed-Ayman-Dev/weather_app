/// Immutable model representing the current weather.
///
/// The model is intentionally flattened to expose only the fields
/// required by the application.
class WeatherModel {
  final String? cityName;
  final String? country;
  final double? temperatureC;
  final String? conditionText;
  final String? conditionIconUrl;
  final int? conditionCode;
  final bool isFromCache;

  const WeatherModel({
    this.cityName,
    this.country,
    this.temperatureC,
    this.conditionText,
    this.conditionIconUrl,
    this.conditionCode,
    this.isFromCache = false,
  });

  /// Parses the response returned by the Weather API.
  factory WeatherModel.fromApiJson(Map<String, dynamic> json) {
    final location = json['location'] as Map<String, dynamic>?;
    final current = json['current'] as Map<String, dynamic>?;
    final condition = current?['condition'] as Map<String, dynamic>?;

    final rawIcon = condition?['icon'] as String?;

    return WeatherModel(
      cityName: location?['name'] as String?,
      country: location?['country'] as String?,
      temperatureC: (current?['temp_c'] as num?)?.toDouble(),
      conditionText: condition?['text'] as String?,
      // The API returns protocol-relative URLs like "//cdn.weatherapi.com/...".
      conditionIconUrl: rawIcon?.startsWith('//') == true
          ? 'https:$rawIcon'
          : rawIcon,
      conditionCode: condition?['code'] as int?,
    );
  }

  WeatherModel copyWith({bool? isFromCache}) => WeatherModel(
    cityName: cityName,
    country: country,
    temperatureC: temperatureC,
    conditionText: conditionText,
    conditionIconUrl: conditionIconUrl,
    conditionCode: conditionCode,
    isFromCache: isFromCache ?? this.isFromCache,
  );

  /// Converts the model into a JSON object for local caching.
  Map<String, dynamic> toCacheJson() => {
    'cityName': cityName,
    'country': country,
    'temperatureC': temperatureC,
    'conditionText': conditionText,
    'conditionIconUrl': conditionIconUrl,
    'conditionCode': conditionCode,
  };

  /// Creates a model from cached data.
  factory WeatherModel.fromCacheJson(Map<String, dynamic> json) => WeatherModel(
    cityName: json['cityName'] as String?,
    country: json['country'] as String?,
    temperatureC: (json['temperatureC'] as num?)?.toDouble(),
    conditionText: json['conditionText'] as String?,
    conditionIconUrl: json['conditionIconUrl'] as String?,
    conditionCode: json['conditionCode'] as int?,
    isFromCache: true,
  );
}
