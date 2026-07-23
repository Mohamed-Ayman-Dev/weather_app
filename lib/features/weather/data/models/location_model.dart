/// name : "Cairo"
/// region : "Al Qahirah"
/// country : "Egypt"
/// lat : 30.05
/// lon : 31.25
/// tz_id : "Africa/Cairo"
/// localtime_epoch : 1784738594
/// localtime : "2026-07-22 19:43"

class LocationModel {
  LocationModel({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,});

  LocationModel.fromJson(dynamic json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }
  String? name;
  String? region;
  String? country;
  num? lat;
  num? lon;
  String? tzId;
  num? localtimeEpoch;
  String? localtime;
  LocationModel copyWith({  String? name,
    String? region,
    String? country,
    num? lat,
    num? lon,
    String? tzId,
    num? localtimeEpoch,
    String? localtime,
  }) => LocationModel(  name: name ?? this.name,
    region: region ?? this.region,
    country: country ?? this.country,
    lat: lat ?? this.lat,
    lon: lon ?? this.lon,
    tzId: tzId ?? this.tzId,
    localtimeEpoch: localtimeEpoch ?? this.localtimeEpoch,
    localtime: localtime ?? this.localtime,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['region'] = region;
    map['country'] = country;
    map['lat'] = lat;
    map['lon'] = lon;
    map['tz_id'] = tzId;
    map['localtime_epoch'] = localtimeEpoch;
    map['localtime'] = localtime;
    return map;
  }

}