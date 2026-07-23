import 'package:weather_app/features/weather/data/models/weather_details_model.dart';
import 'location_model.dart';

/// location : {"name":"Cairo","region":"Al Qahirah","country":"Egypt","lat":30.05,"lon":31.25,"tz_id":"Africa/Cairo","localtime_epoch":1784738594,"localtime":"2026-07-22 19:43"}
/// current : {"last_updated_epoch":1784737800,"last_updated":"2026-07-22 19:30","temp_c":36.3,"temp_f":97.3,"is_day":1,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png","code":1000},"wind_mph":21.5,"wind_kph":34.6,"wind_degree":318,"wind_dir":"NW","pressure_mb":1007.0,"pressure_in":29.74,"precip_mm":0.0,"precip_in":0.0,"humidity":37,"cloud":0,"feelslike_c":34.8,"feelslike_f":94.6,"windchill_c":39.4,"windchill_f":103.0,"heatindex_c":39.1,"heatindex_f":102.4,"dewpoint_c":9.4,"dewpoint_f":48.9,"vis_km":10.0,"vis_miles":6.0,"uv":0.2,"gust_mph":25.5,"gust_kph":41.0,"will_it_rain":0,"chance_of_rain":1,"will_it_snow":0,"chance_of_snow":0}

class WeatherModel {
  WeatherModel({
      this.location, 
      this.current,});

  WeatherModel.fromJson(dynamic json) {
    location = json['location'] != null ? LocationModel.fromJson(json['location']) : null;
    current = json['current'] != null ? WeatherDetailsModel.fromJson(json['current']) : null;
  }
  LocationModel? location;
  WeatherDetailsModel? current;
WeatherModel copyWith({  LocationModel? location,
  WeatherDetailsModel? current,
}) => WeatherModel(  location: location ?? this.location,
  current: current ?? this.current,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (current != null) {
      map['current'] = current?.toJson();
    }
    return map;
  }

}
