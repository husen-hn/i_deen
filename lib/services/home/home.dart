//
//  home.dart
//  Created on 2023 20 August.
//  Copyright © husen-hn Github,
//  Developed by 2023 Hossein HassanNejad.
//

// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter_weather/apps/app/app_repository.dart';
// import 'package:flutter_weather/apps/helper/weather_success_schema.dart';
// import 'package:flutter_weather/apps/helper/status_error_handler_schema.dart';
// import 'package:fpdart/fpdart.dart';

// class Weather {
//   Future<Either<StatusErrorHandlerSchema, WeatherSuccessSchema>> getData(
//       AppRepository appRepository, double latitude, double longitude) async {
//     try {
//       var response =
//           await appRepository.dio.get('/v1/forecast', queryParameters: {
//         'latitude': latitude,
//         'longitude': longitude,
//         'current_weather': 'true',
//         'hourly': 'temperature_2m,relativehumidity_2m,windspeed_10m'
//       });

//       return Either.right(
//           WeatherSuccessSchema.fromJson(jsonDecode(response.toString())));
//     } on DioException catch (ex) {
//       return Either.left(appRepository.statusErrorHandler(ex.response));
//     }
//   }
// }
