//
//  i_deen_router.dart
//  Created on 2023 12 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'dart:convert';

import 'package:serat/ui/drawer/about_us.dart';
import 'package:serat/ui/drawer/copy_right.dart';
import 'package:serat/ui/home/home.dart';
import 'package:serat/ui/quran/juz_reading.dart';
import 'package:serat/ui/quran/page_reading.dart';
import 'package:serat/ui/quran/verses_reading.dart';
import 'package:serat/ui/slpash/splash.dart';

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
                  'verses-reading/:surahNumber/:surahName/:surahEnglishName/:surahType/:versesCount/:verses',
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
            GoRoute(
                name: 'page-reading',
                path: 'page-reading/:surahNumber/:surahVerseNumber',
                builder: (context, state) => PageReading(
                      surahNumber:
                          int.parse(state.pathParameters['surahNumber']!),
                      surahVerseNumber:
                          int.parse(state.pathParameters['surahVerseNumber']!),
                    )),
            GoRoute(
                name: 'juz-reading',
                path: 'page-reading/:juzNumber',
                builder: (context, state) => JuzReading(
                    juzNumber: int.parse(state.pathParameters['juzNumber']!))),
          ]),
      GoRoute(
          name: 'about-us',
          path: '/about-us',
          builder: (context, state) => const AboutUs()),
      GoRoute(
          name: 'copy-right',
          path: '/copy-right',
          builder: (context, state) => const CopyRight()),
    ],
  );
}
