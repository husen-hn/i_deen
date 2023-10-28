// import 'dart:convert';

// IDeenSuccessSchema weatherSuccessSchemaFromJson(String str) =>
//     WeatherSuccessSchema.fromJson(json.decode(str));
// String weatherSuccessSchemaToJson(WeatherSuccessSchema data) =>
//     json.encode(data.toJson());

// class IDeenSuccessSchema {
//   WeatherSuccessSchema({
//     num? latitude,
//     num? longitude,
//     num? generationtimeMs,
//     num? utcOffsetSeconds,
//     String? timezone,
//     String? timezoneAbbreviation,
//     num? elevation,
//     CurrentWeather? currentWeather,
//     HourlyUnits? hourlyUnits,
//     Hourly? hourly,
//   }) {
//     _latitude = latitude;
//     _longitude = longitude;
//     _generationtimeMs = generationtimeMs;
//     _utcOffsetSeconds = utcOffsetSeconds;
//     _timezone = timezone;
//     _timezoneAbbreviation = timezoneAbbreviation;
//     _elevation = elevation;
//     _currentWeather = currentWeather;
//     _hourlyUnits = hourlyUnits;
//     _hourly = hourly;
//   }

//   WeatherSuccessSchema.fromJson(dynamic json) {
//     _latitude = json['latitude'];
//     _longitude = json['longitude'];
//     _generationtimeMs = json['generationtime_ms'];
//     _utcOffsetSeconds = json['utc_offset_seconds'];
//     _timezone = json['timezone'];
//     _timezoneAbbreviation = json['timezone_abbreviation'];
//     _elevation = json['elevation'];
//     _currentWeather = json['current_weather'] != null
//         ? CurrentWeather.fromJson(json['current_weather'])
//         : null;
//     _hourlyUnits = json['hourly_units'] != null
//         ? HourlyUnits.fromJson(json['hourly_units'])
//         : null;
//     _hourly = json['hourly'] != null ? Hourly.fromJson(json['hourly']) : null;
//   }
//   num? _latitude;
//   num? _longitude;
//   num? _generationtimeMs;
//   num? _utcOffsetSeconds;
//   String? _timezone;
//   String? _timezoneAbbreviation;
//   num? _elevation;
//   CurrentWeather? _currentWeather;
//   HourlyUnits? _hourlyUnits;
//   Hourly? _hourly;
//   WeatherSuccessSchema copyWith({
//     num? latitude,
//     num? longitude,
//     num? generationtimeMs,
//     num? utcOffsetSeconds,
//     String? timezone,
//     String? timezoneAbbreviation,
//     num? elevation,
//     CurrentWeather? currentWeather,
//     HourlyUnits? hourlyUnits,
//     Hourly? hourly,
//   }) =>
//       WeatherSuccessSchema(
//         latitude: latitude ?? _latitude,
//         longitude: longitude ?? _longitude,
//         generationtimeMs: generationtimeMs ?? _generationtimeMs,
//         utcOffsetSeconds: utcOffsetSeconds ?? _utcOffsetSeconds,
//         timezone: timezone ?? _timezone,
//         timezoneAbbreviation: timezoneAbbreviation ?? _timezoneAbbreviation,
//         elevation: elevation ?? _elevation,
//         currentWeather: currentWeather ?? _currentWeather,
//         hourlyUnits: hourlyUnits ?? _hourlyUnits,
//         hourly: hourly ?? _hourly,
//       );
//   num? get latitude => _latitude;
//   num? get longitude => _longitude;
//   num? get generationtimeMs => _generationtimeMs;
//   num? get utcOffsetSeconds => _utcOffsetSeconds;
//   String? get timezone => _timezone;
//   String? get timezoneAbbreviation => _timezoneAbbreviation;
//   num? get elevation => _elevation;
//   CurrentWeather? get currentWeather => _currentWeather;
//   HourlyUnits? get hourlyUnits => _hourlyUnits;
//   Hourly? get hourly => _hourly;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['latitude'] = _latitude;
//     map['longitude'] = _longitude;
//     map['generationtime_ms'] = _generationtimeMs;
//     map['utc_offset_seconds'] = _utcOffsetSeconds;
//     map['timezone'] = _timezone;
//     map['timezone_abbreviation'] = _timezoneAbbreviation;
//     map['elevation'] = _elevation;
//     if (_currentWeather != null) {
//       map['current_weather'] = _currentWeather?.toJson();
//     }
//     if (_hourlyUnits != null) {
//       map['hourly_units'] = _hourlyUnits?.toJson();
//     }
//     if (_hourly != null) {
//       map['hourly'] = _hourly?.toJson();
//     }
//     return map;
//   }
// }

// Hourly hourlyFromJson(String str) => Hourly.fromJson(json.decode(str));
// String hourlyToJson(Hourly data) => json.encode(data.toJson());

// class Hourly {
//   Hourly({
//     List<String>? time,
//     List<num>? temperature2m,
//     List<num>? relativehumidity2m,
//     List<num>? windspeed10m,
//   }) {
//     _time = time;
//     _temperature2m = temperature2m;
//     _relativehumidity2m = relativehumidity2m;
//     _windspeed10m = windspeed10m;
//   }

//   Hourly.fromJson(dynamic json) {
//     _time = json['time'] != null ? json['time'].cast<String>() : [];
//     _temperature2m = json['temperature_2m'] != null
//         ? json['temperature_2m'].cast<num>()
//         : [];
//     _relativehumidity2m = json['relativehumidity_2m'] != null
//         ? json['relativehumidity_2m'].cast<num>()
//         : [];
//     _windspeed10m =
//         json['windspeed_10m'] != null ? json['windspeed_10m'].cast<num>() : [];
//   }
//   List<String>? _time;
//   List<num>? _temperature2m;
//   List<num>? _relativehumidity2m;
//   List<num>? _windspeed10m;
//   Hourly copyWith({
//     List<String>? time,
//     List<num>? temperature2m,
//     List<num>? relativehumidity2m,
//     List<num>? windspeed10m,
//   }) =>
//       Hourly(
//         time: time ?? _time,
//         temperature2m: temperature2m ?? _temperature2m,
//         relativehumidity2m: relativehumidity2m ?? _relativehumidity2m,
//         windspeed10m: windspeed10m ?? _windspeed10m,
//       );
//   List<String>? get time => _time;
//   List<num>? get temperature2m => _temperature2m;
//   List<num>? get relativehumidity2m => _relativehumidity2m;
//   List<num>? get windspeed10m => _windspeed10m;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['time'] = _time;
//     map['temperature_2m'] = _temperature2m;
//     map['relativehumidity_2m'] = _relativehumidity2m;
//     map['windspeed_10m'] = _windspeed10m;
//     return map;
//   }
// }

// HourlyUnits hourlyUnitsFromJson(String str) =>
//     HourlyUnits.fromJson(json.decode(str));
// String hourlyUnitsToJson(HourlyUnits data) => json.encode(data.toJson());

// class HourlyUnits {
//   HourlyUnits({
//     String? time,
//     String? temperature2m,
//     String? relativehumidity2m,
//     String? windspeed10m,
//   }) {
//     _time = time;
//     _temperature2m = temperature2m;
//     _relativehumidity2m = relativehumidity2m;
//     _windspeed10m = windspeed10m;
//   }

//   HourlyUnits.fromJson(dynamic json) {
//     _time = json['time'];
//     _temperature2m = json['temperature_2m'];
//     _relativehumidity2m = json['relativehumidity_2m'];
//     _windspeed10m = json['windspeed_10m'];
//   }
//   String? _time;
//   String? _temperature2m;
//   String? _relativehumidity2m;
//   String? _windspeed10m;
//   HourlyUnits copyWith({
//     String? time,
//     String? temperature2m,
//     String? relativehumidity2m,
//     String? windspeed10m,
//   }) =>
//       HourlyUnits(
//         time: time ?? _time,
//         temperature2m: temperature2m ?? _temperature2m,
//         relativehumidity2m: relativehumidity2m ?? _relativehumidity2m,
//         windspeed10m: windspeed10m ?? _windspeed10m,
//       );
//   String? get time => _time;
//   String? get temperature2m => _temperature2m;
//   String? get relativehumidity2m => _relativehumidity2m;
//   String? get windspeed10m => _windspeed10m;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['time'] = _time;
//     map['temperature_2m'] = _temperature2m;
//     map['relativehumidity_2m'] = _relativehumidity2m;
//     map['windspeed_10m'] = _windspeed10m;
//     return map;
//   }
// }

// CurrentWeather currentWeatherFromJson(String str) =>
//     CurrentWeather.fromJson(json.decode(str));
// String currentWeatherToJson(CurrentWeather data) => json.encode(data.toJson());

// class CurrentWeather {
//   CurrentWeather({
//     num? temperature,
//     num? windspeed,
//     num? winddirection,
//     num? weathercode,
//     num? isDay,
//     String? time,
//   }) {
//     _temperature = temperature;
//     _windspeed = windspeed;
//     _winddirection = winddirection;
//     _weathercode = weathercode;
//     _isDay = isDay;
//     _time = time;
//   }

//   CurrentWeather.fromJson(dynamic json) {
//     _temperature = json['temperature'];
//     _windspeed = json['windspeed'];
//     _winddirection = json['winddirection'];
//     _weathercode = json['weathercode'];
//     _isDay = json['is_day'];
//     _time = json['time'];
//   }
//   num? _temperature;
//   num? _windspeed;
//   num? _winddirection;
//   num? _weathercode;
//   num? _isDay;
//   String? _time;
//   CurrentWeather copyWith({
//     num? temperature,
//     num? windspeed,
//     num? winddirection,
//     num? weathercode,
//     num? isDay,
//     String? time,
//   }) =>
//       CurrentWeather(
//         temperature: temperature ?? _temperature,
//         windspeed: windspeed ?? _windspeed,
//         winddirection: winddirection ?? _winddirection,
//         weathercode: weathercode ?? _weathercode,
//         isDay: isDay ?? _isDay,
//         time: time ?? _time,
//       );
//   num? get temperature => _temperature;
//   num? get windspeed => _windspeed;
//   num? get winddirection => _winddirection;
//   num? get weathercode => _weathercode;
//   num? get isDay => _isDay;
//   String? get time => _time;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['temperature'] = _temperature;
//     map['windspeed'] = _windspeed;
//     map['winddirection'] = _winddirection;
//     map['weathercode'] = _weathercode;
//     map['is_day'] = _isDay;
//     map['time'] = _time;
//     return map;
//   }
// }
