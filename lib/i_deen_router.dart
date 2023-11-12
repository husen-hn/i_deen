//
//  i_deen_router.dart
//  Created on 2023 12 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:i_deen/ui/home/home.dart';
import 'package:i_deen/ui/quran/verses_reading.dart';
import 'package:i_deen/ui/slpash/splash.dart';

class IDeenRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Splash(),
      ),
      GoRoute(
          path: '/home',
          builder: (context, state) => const Home(),
          routes: [
            GoRoute(
              name: 'verses-reading',
              path:
                  'reading/:surahNumber/:surahName/:surahEnglishName/:surahType/:versesCount/:verses',
              builder: (context, state) => VersesReading(
                  surahNumber: int.parse(state.pathParameters['surahNumber']!),
                  surahName: state.pathParameters['surahName']!,
                  surahEnglishName: state.pathParameters['surahEnglishName']!,
                  surahType: state.pathParameters['surahType']!,
                  versesCount: int.parse(state.pathParameters['versesCount']!),
                  verses: state.pathParameters['verses']! == 'null'
                      ? null
                      : json
                          .decode(state.pathParameters['verses']!)
                          .cast<int>()
                          .toList()),
            ),
          ]),
    ],
  );
}
