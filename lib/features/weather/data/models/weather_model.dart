/// Immutable data model for a single "current weather" lookup.
///
/// Kept intentionally flat (no nested location/current sub-objects) because
/// nothing else in this app needs the raw API shape — the UI only ever
/// needs these fields

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

  /// Parses the response shape returned by api.weatherapi.com/v1/current.json
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
      conditionIconUrl:
      rawIcon?.startsWith('//') == true
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

  Map<String, dynamic> toCacheJson() => {
        'cityName': cityName,
        'country': country,
        'temperatureC': temperatureC,
        'conditionText': conditionText,
        'conditionIconUrl': conditionIconUrl,
        'conditionCode': conditionCode,
      };

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
