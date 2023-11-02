//
//  home_repository.dart
//  Created on 2023 20 August.
//  Copyright © husen-hn Github,
//  Developed by 2023 Hossein HassanNejad.
//

// import 'package:flutter_weather/apps/app/app_repository.dart';
// import 'package:flutter_weather/apps/weather/weather.dart';
// import 'package:flutter_weather/apps/helper/weather_success_schema.dart';
// import 'package:flutter_weather/apps/helper/status_error_handler_schema.dart';
// import 'package:fpdart/fpdart.dart';

// abstract class IWeatherRepository {
//   Future<Either<StatusErrorHandlerSchema, WeatherSuccessSchema>> getData(
//       AppRepository appRepository, double latitude, double longitude);
// }

// class WeatherRepository implements IWeatherRepository {
//   WeatherRepository({required Weather weather}) : _weather = weather;

//   final Weather _weather;

//   @override
//   Future<Either<StatusErrorHandlerSchema, WeatherSuccessSchema>> getData(
//           AppRepository appRepository,
//           double latitude,
//           double longitude) async =>
//       _weather.getData(appRepository, latitude, longitude);
// }
