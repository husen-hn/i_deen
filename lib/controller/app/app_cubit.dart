//
//  app_cubit.dart
//  Created on 2023 02 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i_deen/services/helper/cache_helper.dart';
import 'package:i_deen/services/helper/l10n/app_local.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
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
}
