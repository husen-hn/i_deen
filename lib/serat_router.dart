//
//  serat_router.dart
//  Created on 2023 06 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serat/services/helper/verses_schema.dart';
import 'package:serat/ui/bookmark/bookmark_reading.dart';
import 'package:serat/ui/drawer/about_us.dart';
import 'package:serat/ui/drawer/copy_right.dart';
import 'package:serat/ui/home/home.dart';
import 'package:serat/ui/quran/juz_reading.dart';
import 'package:serat/ui/quran/page_reading.dart';
import 'package:serat/ui/quran/verses_reading.dart';
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
        CustomRoute(page: VersesReadingRoute.page),
        CustomRoute(page: PageReadingRoute.page),
        CustomRoute(page: JuzReadingRoute.page),
        CustomRoute(page: AboutUsRoute.page),
        CustomRoute(page: CopyRightRoute.page),
        CustomRoute(page: BookmarkReadingRoute.page)
      ];
}
