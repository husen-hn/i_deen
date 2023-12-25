//
//  bootstrap.dart
//  Created on 2023 20 August.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'dart:async';
import 'dart:developer';

import 'package:adivery/adivery.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/observer.dart';
import 'package:serat/ui/app/app.dart';

Future<void> bootstrap() async {
  ///
  /// print all state change errors about [Bloc] library in console.
  ///
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  ///
  /// observes all state changes about [Bloc] library.
  ///
  Bloc.observer = const Observer();

  final AppRepository appRepository = AppRepository();

  AdiveryPlugin.initialize('59c36ce3-7125-40a7-bd34-144e6906c796');

  runApp(App(appRepository: appRepository));
}
