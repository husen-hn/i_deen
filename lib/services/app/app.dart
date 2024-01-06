//
//  app.dart
//  Created on 2023 26 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:serat/services/helper/cache_helper.dart';
import 'package:serat/services/helper/hizb_starter_schema.dart';
import 'package:serat/services/helper/juz_starter_schema.dart';
import 'package:serat/services/helper/original_data_success_schema.dart';
import 'package:serat/services/helper/reading_page_schema.dart';
import 'package:serat/services/helper/saved_verses_schema.dart';
import 'package:serat/services/helper/tr_data_success_schema.dart';
import 'package:serat/services/helper/serat_translation.dart';
import 'package:quran/quran.dart' as quran;

class App {
  List<JuzStarterSchema> get _totalJuzList => const [
        JuzStarterSchema(1, 1, 1),
        JuzStarterSchema(2, 2, 142),
        JuzStarterSchema(3, 2, 253),
        JuzStarterSchema(4, 3, 93),
        JuzStarterSchema(5, 4, 24),
        JuzStarterSchema(6, 4, 148),
        JuzStarterSchema(7, 5, 82),
        JuzStarterSchema(8, 6, 111),
        JuzStarterSchema(9, 7, 88),
        JuzStarterSchema(10, 8, 41),
        JuzStarterSchema(11, 9, 93),
        JuzStarterSchema(12, 11, 6),
        JuzStarterSchema(13, 12, 53),
        JuzStarterSchema(14, 15, 1),
        JuzStarterSchema(15, 17, 1),
        JuzStarterSchema(16, 18, 75),
        JuzStarterSchema(17, 21, 1),
        JuzStarterSchema(18, 23, 1),
        JuzStarterSchema(19, 25, 21),
        JuzStarterSchema(20, 27, 56),
        JuzStarterSchema(21, 29, 46),
        JuzStarterSchema(22, 33, 31),
        JuzStarterSchema(23, 36, 28),
        JuzStarterSchema(24, 39, 32),
        JuzStarterSchema(25, 41, 47),
        JuzStarterSchema(26, 46, 1),
        JuzStarterSchema(27, 51, 31),
        JuzStarterSchema(28, 58, 1),
        JuzStarterSchema(29, 67, 1),
        JuzStarterSchema(30, 78, 1),
      ];
  List<HizbStarterSchema> get _totalHizbList => const [
        HizbStarterSchema(1, 1, 1),
        HizbStarterSchema(2, 2, 75),
        HizbStarterSchema(3, 2, 142),
        HizbStarterSchema(4, 2, 203),
        HizbStarterSchema(5, 2, 253),
        HizbStarterSchema(6, 3, 15),
        HizbStarterSchema(7, 3, 93),
        HizbStarterSchema(8, 3, 164),
        HizbStarterSchema(9, 4, 23),
        HizbStarterSchema(10, 4, 88),
        HizbStarterSchema(11, 4, 148),
        HizbStarterSchema(12, 5, 27),
        HizbStarterSchema(13, 5, 82),
        HizbStarterSchema(14, 6, 30),
        HizbStarterSchema(15, 6, 111),
        HizbStarterSchema(16, 7, 1),
        HizbStarterSchema(17, 7, 85),
        HizbStarterSchema(18, 7, 171),
        HizbStarterSchema(19, 8, 41),
        HizbStarterSchema(20, 9, 34),
        HizbStarterSchema(21, 9, 90),
        HizbStarterSchema(22, 10, 26),
        HizbStarterSchema(23, 11, 6),
        HizbStarterSchema(24, 11, 84),
        HizbStarterSchema(25, 12, 53),
        HizbStarterSchema(26, 13, 19),
        HizbStarterSchema(27, 15, 1),
        HizbStarterSchema(28, 16, 51),
        HizbStarterSchema(29, 17, 1),
        HizbStarterSchema(30, 17, 99),
        HizbStarterSchema(31, 18, 75),
        HizbStarterSchema(32, 20, 1),
        HizbStarterSchema(33, 21, 1),
        HizbStarterSchema(34, 22, 1),
        HizbStarterSchema(35, 23, 1),
        HizbStarterSchema(36, 24, 21),
        HizbStarterSchema(37, 25, 21),
        HizbStarterSchema(38, 26, 111),
        HizbStarterSchema(39, 27, 54),
        HizbStarterSchema(40, 28, 51),
        HizbStarterSchema(41, 29, 46),
        HizbStarterSchema(42, 31, 22),
        HizbStarterSchema(43, 33, 28),
        HizbStarterSchema(44, 34, 24),
        HizbStarterSchema(45, 35, 28),
        HizbStarterSchema(46, 37, 145),
        HizbStarterSchema(47, 39, 32),
        HizbStarterSchema(48, 40, 41),
        HizbStarterSchema(49, 41, 47),
        HizbStarterSchema(50, 43, 24),
        HizbStarterSchema(51, 46, 1),
        HizbStarterSchema(52, 48, 18),
        HizbStarterSchema(53, 51, 31),
        HizbStarterSchema(54, 55, 1),
        HizbStarterSchema(55, 58, 1),
        HizbStarterSchema(56, 62, 1),
        HizbStarterSchema(57, 67, 1),
        HizbStarterSchema(58, 72, 1),
        HizbStarterSchema(59, 78, 1),
        HizbStarterSchema(60, 87, 1)
      ];

  Future<ReadingPageSchema> getPageData(
      {required int page, List<int?>? itemToScroll}) async {
    ReadingPageSchema data = ReadingPageSchema(
        pageNumber: page,
        pageJuzNumber: null,
        pageHizbNumber: null,
        scrollPosition: null,
        surahs: <SurahData>[]);

    // [{surah: 112, start: 1, end: 5}, {surah: 113, start: 1, end: 4}]
    List<Map<String, dynamic>> pageData =
        quran.getPageData(page) as List<Map<String, dynamic>>;

    // count previous items height to find saved item position
    int savedItemCounter = 0;
    int? savedItemIndex;

    // get surahs
    for (var i = 0; i < pageData.length; i++) {
      int surahNumber = pageData[i]['surah'];
      int start = pageData[i]['start'];
      int end = pageData[i]['end'];

      List<TrVerse> trData =
          await _getTrData(SeratTranslation.makarem, surahNumber);
      List<SavedVerseSchema> savedVerses = await getSavedData();

      List<VerseData> verses = [];

      // if itemToScroll is null, we dont need to scroll
      // count previous SurahStarter index in first
      if (itemToScroll != null && start == 1) {
        savedItemCounter += 1;
      }

      // get surah's verses
      for (var verseNumber = start; verseNumber <= end; verseNumber++) {
        String arabicText = quran.getVerse(surahNumber, verseNumber);
        String trText = trData[verseNumber - 1].translation ?? '';

        int? verseJuzNumber;

        for (var i = 0; i < _totalJuzList.length; i++) {
          if (surahNumber == _totalJuzList[i].surahNumber &&
              verseNumber == _totalJuzList[i].verseNumber) {
            verseJuzNumber = _totalJuzList[i].juzNumber;
          }
        }

        int? verseHizbNumber;

        for (var i = 0; i < _totalHizbList.length; i++) {
          if (surahNumber == _totalHizbList[i].surahNumber &&
              verseNumber == _totalHizbList[i].verseNumber) {
            verseHizbNumber = _totalHizbList[i].hizbNumber;
          }
        }

        // if itemToScroll is null, we dont need to scroll
        if (itemToScroll != null) {
          if (itemToScroll.first == surahNumber &&
              itemToScroll.last == verseNumber) {
            // mines 1 when selected verse is the first verse to displat besmelah
            if (itemToScroll.last == 1) {
              savedItemCounter -= 1;
            }
            savedItemIndex = savedItemCounter;
          } else {
            savedItemCounter += 1;
          }
        }
        verses.add(VerseData(
            verseNumber: verseNumber,
            juzNumber: verseJuzNumber,
            hizbNumber: verseHizbNumber,
            arabicText: arabicText,
            trText: trText,
            isSaved: _isVerseSaved(savedVerses, surahNumber, verseNumber)));
      }

      data.surahs.add(SurahData(
          surahName: quran.getSurahNameArabic(surahNumber),
          surahNumber: surahNumber,
          verses: verses));
    }

    data.pageJuzNumber = _getJuzNumber(
        data.surahs.last.surahNumber, data.surahs.last.verses.last.verseNumber);

    // data.pageHizbNumber = _getHizbNumber(
    //     data.surahs.last.surahNumber, data.surahs.last.verses.last.verseNumber);

    if (itemToScroll != null) {
      data.scrollPosition = savedItemIndex;
    }

    return data;
  }

  Future<bool> isNetworkActive() async {
    bool res = true;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        res = true;
      }
    } on SocketException catch (_) {
      res = false;
    }
    return res;
  }

  Future<bool> isVpnActive() async {
    bool isVpnActive;
    List<NetworkInterface> interfaces = await NetworkInterface.list(
        includeLoopback: false, type: InternetAddressType.any);

    interfaces.isNotEmpty
        ? isVpnActive = interfaces.any((interface) =>
            interface.name.contains("tun") ||
            interface.name.contains("ppp") ||
            interface.name.contains("pptp") ||
            interface.name.contains("tap") ||
            interface.name.contains("l2tp") ||
            interface.name.contains("ipsec") ||
            interface.name.contains("vpn"))
        : isVpnActive = false;
    return isVpnActive;
  }

  Future<List<SavedVerseSchema>> getSavedData() async {
    List<String> savedVerses = CacheHelper.getSavedVerses();

    List<SavedVerseSchema> data = <SavedVerseSchema>[];

    for (var savedIndex = 0; savedIndex < savedVerses.length; savedIndex++) {
      int surahNumber = int.parse(savedVerses[savedIndex].split('-').first);
      int verseNumber = int.parse(savedVerses[savedIndex].split('-').last);

      // List<OriginalVerse> originalVerses = await _getOriginalData(surahNumber);

      List<TrVerse> trVerses =
          await _getTrData(SeratTranslation.makarem, surahNumber);

      data.add(SavedVerseSchema(
          surahNumber: surahNumber,
          surahArabicName: quran.getSurahNameArabic(surahNumber),
          verseNumber: verseNumber,
          verseArabicText: quran.getVerse(surahNumber,
              verseNumber), //originalVerses[verseNumber - 1].content ?? '',
          translation: trVerses[verseNumber - 1].translation ?? ''));
    }

    return data;
  }

  int _getJuzNumber(int surahNumber, int verseNumber) =>
      quran.getJuzNumber(surahNumber, verseNumber);

  // int _getHizbNumber(int surahNumber, int verseNumber) {
  //   _totalHizbList.fin
  //   return
  // }

  Future<List<TrVerse>> _getTrData(SeratTranslation tr, int surahNumber) async {
    String response = tr == SeratTranslation.makarem
        ? await _readLocalJson(SeratTranslation.makarem.name!)
        : await _readLocalJson('');

    TrDataSuccessSchema data =
        TrDataSuccessSchema.fromJson(jsonDecode(response));

    return data.list[surahNumber - 1].verses;
  }

  Future<List<OriginalVerse>> _getOriginalData(int surahNumber) async {
    String response = await _readLocalJson(SeratTranslation.original.name!);

    OriginalDataSuccessSchema data =
        OriginalDataSuccessSchema.fromJson(jsonDecode(response));

    return data.list[surahNumber - 1].verses;
  }

  Future<String> _readLocalJson(String path) async =>
      await rootBundle.loadString(path);

  bool _isVerseSaved(
      List<SavedVerseSchema> savedVerses, int surahNumber, int verseNumber) {
    bool isSaved = false;

    for (var i = 0; i < savedVerses.length; i++) {
      if (savedVerses[i].surahNumber == surahNumber &&
          savedVerses[i].verseNumber == verseNumber) {
        isSaved = true;
      }
    }

    return isSaved;
  }

  JuzStarterSchema starterJuzData(int juzNumber) =>
      _totalJuzList.firstWhere((e) => e.juzNumber == juzNumber);

  HizbStarterSchema starterHizbData(int hizbNumber) =>
      _totalHizbList.firstWhere((e) => e.hizbNumber == hizbNumber);
}
