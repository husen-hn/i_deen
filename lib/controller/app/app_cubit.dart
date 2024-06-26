//
//  app_cubit.dart
//  Created on 2023 02 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/articles/articles_repository.dart';
import 'package:serat/services/helper/cache_helper.dart';
import 'package:serat/services/helper/l10n/app_local.dart';
import 'package:quran/quran.dart' as quran;
import 'package:share_plus/share_plus.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppRepository appRepository;
  ArticlesRepository articlesRepository;

  AppCubit({required this.appRepository, required this.articlesRepository})
      : super(const AppState()
            .copyWith(status: () => AppStatus.langCode, langCode: () => 'fa'));

  final ThemeData appTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        foregroundColor: Color(0xFF672CBC),
        backgroundColor: Color(0xFFFAFAFA),
        titleTextStyle: TextStyle(
            fontFamily: 'BTitr',
            fontSize: 21,
            fontWeight: FontWeight.w400,
            color: Color(0xFF672CBC))),
  );

  final List<Locale> l10n = const [
    Locale('fa', ''),
    Locale('en', ''),
    Locale('ar', ''),
  ];

  final Iterable<LocalizationsDelegate<dynamic>> l10nDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  String getSavedLanguage() {
    final String cachedLanguageCode = CacheHelper.getCachedLanguage();
    return cachedLanguageCode;
  }

  Future<void> changeLanguage(String languageCode) async {
    await CacheHelper.cacheLanguage(languageCode);
  }

  void scrollTo(ScrollController controller, double position, Curve curve) {
    controller.animateTo(position,
        duration: const Duration(seconds: 1), curve: curve);
  }

  get totalPagesCount => quran.totalPagesCount;
  getPageNumber(int surahNumber, int verseNumber) =>
      quran.getPageNumber(surahNumber, verseNumber);

  int lastSurahNum = 1;
  int lastVerseNum = 1;
  void saveLastSeen(int surahNumber, int verseNumber, Duration duration) {
    lastSurahNum = surahNumber;
    lastVerseNum = verseNumber;

    Future.delayed(duration).then((value) async {
      await CacheHelper.saveLastSeen(lastSurahNum, lastVerseNum);
    });
  }

  void shareText(String text) {
    Share.share(text);
  }
}
