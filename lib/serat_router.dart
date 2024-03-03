//
//  serat_router.dart
//  Created on 2023 06 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/ui/bookmark/bookmark_reading.dart';
import 'package:serat/ui/drawer/about_us.dart';
import 'package:serat/ui/drawer/settings.dart';
import 'package:serat/ui/home/home.dart';
import 'package:serat/ui/quran/quran_reading.dart';
import 'package:serat/ui/slpash/splash.dart';
part 'serat_router.gr.dart';

@AutoRouterConfig()
class SeratRouter extends _$SeratRouter {
  @override
  RouteType get defaultRouteType => const RouteType.custom();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(page: SplashRoute.page, initial: true),
        CustomRoute(page: HomeRoute.page),
        CustomRoute(
            page: QuranReadingRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft),
        CustomRoute(
            page: AboutUsRoute.page,
            transitionsBuilder: TransitionsBuilders.slideBottom),
        CustomRoute(
            page: SettingsRoute.page,
            transitionsBuilder: TransitionsBuilders.slideBottom),
        CustomRoute(
            page: BookmarkReadingRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeft)
      ];
}
