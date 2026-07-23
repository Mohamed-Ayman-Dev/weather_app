/// last_updated_epoch : 1784737800
/// last_updated : "2026-07-22 19:30"
/// temp_c : 36.3
/// temp_f : 97.3
/// is_day : 1
/// condition : {"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png","code":1000}
/// wind_mph : 21.5
/// wind_kph : 34.6
/// wind_degree : 318
/// wind_dir : "NW"
/// pressure_mb : 1007.0
/// pressure_in : 29.74
/// precip_mm : 0.0
/// precip_in : 0.0
/// humidity : 37
/// cloud : 0
/// feelslike_c : 34.8
/// feelslike_f : 94.6
/// windchill_c : 39.4
/// windchill_f : 103.0
/// heatindex_c : 39.1
/// heatindex_f : 102.4
/// dewpoint_c : 9.4
/// dewpoint_f : 48.9
/// vis_km : 10.0
/// vis_miles : 6.0
/// uv : 0.2
/// gust_mph : 25.5
/// gust_kph : 41.0
/// will_it_rain : 0
/// chance_of_rain : 1
/// will_it_snow : 0
/// chance_of_snow : 0

class WeatherDetailsModel {
  WeatherDetailsModel({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,});

  WeatherDetailsModel.fromJson(dynamic json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    windchillC = json['windchill_c'];
    windchillF = json['windchill_f'];
    heatindexC = json['heatindex_c'];
    heatindexF = json['heatindex_f'];
    dewpointC = json['dewpoint_c'];
    dewpointF = json['dewpoint_f'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    uv = json['uv'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
    willItRain = json['will_it_rain'];
    chanceOfRain = json['chance_of_rain'];
    willItSnow = json['will_it_snow'];
    chanceOfSnow = json['chance_of_snow'];
  }
  num? lastUpdatedEpoch;
  String? lastUpdated;
  num? tempC;
  num? tempF;
  num? isDay;
  Condition? condition;
  num? windMph;
  num? windKph;
  num? windDegree;
  String? windDir;
  num? pressureMb;
  num? pressureIn;
  num? precipMm;
  num? precipIn;
  num? humidity;
  num? cloud;
  num? feelslikeC;
  num? feelslikeF;
  num? windchillC;
  num? windchillF;
  num? heatindexC;
  num? heatindexF;
  num? dewpointC;
  num? dewpointF;
  num? visKm;
  num? visMiles;
  num? uv;
  num? gustMph;
  num? gustKph;
  num? willItRain;
  num? chanceOfRain;
  num? willItSnow;
  num? chanceOfSnow;
  WeatherDetailsModel copyWith({  num? lastUpdatedEpoch,
    String? lastUpdated,
    num? tempC,
    num? tempF,
    num? isDay,
    Condition? condition,
    num? windMph,
    num? windKph,
    num? windDegree,
    String? windDir,
    num? pressureMb,
    num? pressureIn,
    num? precipMm,
    num? precipIn,
    num? humidity,
    num? cloud,
    num? feelslikeC,
    num? feelslikeF,
    num? windchillC,
    num? windchillF,
    num? heatindexC,
    num? heatindexF,
    num? dewpointC,
    num? dewpointF,
    num? visKm,
    num? visMiles,
    num? uv,
    num? gustMph,
    num? gustKph,
    num? willItRain,
    num? chanceOfRain,
    num? willItSnow,
    num? chanceOfSnow,
  }) => WeatherDetailsModel(  lastUpdatedEpoch: lastUpdatedEpoch ?? this.lastUpdatedEpoch,
    lastUpdated: lastUpdated ?? this.lastUpdated,
    tempC: tempC ?? this.tempC,
    tempF: tempF ?? this.tempF,
    isDay: isDay ?? this.isDay,
    condition: condition ?? this.condition,
    windMph: windMph ?? this.windMph,
    windKph: windKph ?? this.windKph,
    windDegree: windDegree ?? this.windDegree,
    windDir: windDir ?? this.windDir,
    pressureMb: pressureMb ?? this.pressureMb,
    pressureIn: pressureIn ?? this.pressureIn,
    precipMm: precipMm ?? this.precipMm,
    precipIn: precipIn ?? this.precipIn,
    humidity: humidity ?? this.humidity,
    cloud: cloud ?? this.cloud,
    feelslikeC: feelslikeC ?? this.feelslikeC,
    feelslikeF: feelslikeF ?? this.feelslikeF,
    windchillC: windchillC ?? this.windchillC,
    windchillF: windchillF ?? this.windchillF,
    heatindexC: heatindexC ?? this.heatindexC,
    heatindexF: heatindexF ?? this.heatindexF,
    dewpointC: dewpointC ?? this.dewpointC,
    dewpointF: dewpointF ?? this.dewpointF,
    visKm: visKm ?? this.visKm,
    visMiles: visMiles ?? this.visMiles,
    uv: uv ?? this.uv,
    gustMph: gustMph ?? this.gustMph,
    gustKph: gustKph ?? this.gustKph,
    willItRain: willItRain ?? this.willItRain,
    chanceOfRain: chanceOfRain ?? this.chanceOfRain,
    willItSnow: willItSnow ?? this.willItSnow,
    chanceOfSnow: chanceOfSnow ?? this.chanceOfSnow,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['last_updated_epoch'] = lastUpdatedEpoch;
    map['last_updated'] = lastUpdated;
    map['temp_c'] = tempC;
    map['temp_f'] = tempF;
    map['is_day'] = isDay;
    if (condition != null) {
      map['condition'] = condition?.toJson();
    }
    map['wind_mph'] = windMph;
    map['wind_kph'] = windKph;
    map['wind_degree'] = windDegree;
    map['wind_dir'] = windDir;
    map['pressure_mb'] = pressureMb;
    map['pressure_in'] = pressureIn;
    map['precip_mm'] = precipMm;
    map['precip_in'] = precipIn;
    map['humidity'] = humidity;
    map['cloud'] = cloud;
    map['feelslike_c'] = feelslikeC;
    map['feelslike_f'] = feelslikeF;
    map['windchill_c'] = windchillC;
    map['windchill_f'] = windchillF;
    map['heatindex_c'] = heatindexC;
    map['heatindex_f'] = heatindexF;
    map['dewpoint_c'] = dewpointC;
    map['dewpoint_f'] = dewpointF;
    map['vis_km'] = visKm;
    map['vis_miles'] = visMiles;
    map['uv'] = uv;
    map['gust_mph'] = gustMph;
    map['gust_kph'] = gustKph;
    map['will_it_rain'] = willItRain;
    map['chance_of_rain'] = chanceOfRain;
    map['will_it_snow'] = willItSnow;
    map['chance_of_snow'] = chanceOfSnow;
    return map;
  }

}

/// text : "Clear"
/// icon : "//cdn.weatherapi.com/weather/64x64/day/113.png"
/// code : 1000

class Condition {
  Condition({
    this.text,
    this.icon,
    this.code,});

  Condition.fromJson(dynamic json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }
  String? text;
  String? icon;
  num? code;
  Condition copyWith({  String? text,
    String? icon,
    num? code,
  }) => Condition(  text: text ?? this.text,
    icon: icon ?? this.icon,
    code: code ?? this.code,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['icon'] = icon;
    map['code'] = code;
    return map;
  }

}
