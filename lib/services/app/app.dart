//
//  app.dart
//  Created on 2023 26 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:serat/services/helper/cache_helper.dart';
import 'package:serat/services/helper/reading_page_schema.dart';
import 'package:serat/services/helper/saved_verses_schema.dart';
import 'package:serat/services/helper/tr_data_success_schema.dart';
import 'package:serat/services/helper/translation.dart';
import 'package:quran/quran.dart' as quran;

class App {
  Future<ReadingPageSchema> getPageData(
      {required int page, List<int?>? itemToScroll, required Size size}) async {
    ReadingPageSchema data = ReadingPageSchema(
        pageNumber: page, scrollPosition: null, surahs: <SurahData>[]);

    // [{surah: 112, start: 1, end: 5}, {surah: 113, start: 1, end: 4}]
    List<Map<String, dynamic>> pageData =
        quran.getPageData(page) as List<Map<String, dynamic>>;

    // count previous items height to find saved item position
    double savedItemPositionCounter = 0.0;
    double? savedItemPosition;

    // get surahs
    for (var i = 0; i < pageData.length; i++) {
      int surahNumber = pageData[i]['surah'];
      int start = pageData[i]['start'];
      int end = pageData[i]['end'];

      List<Verse> trData = await _getTrData(Translation.makarem, surahNumber);
      List<SavedVerseSchema> savedVerses = await getSavedData();

      List<VerseData> verses = [];

      // if itemToScroll is null, we dont need to scroll
      // count previous SurahStarter height in first
      //TODO: make it better
      if (itemToScroll != null && start == 1 && itemToScroll.last != 1) {
        surahNumber == 9
            ? savedItemPositionCounter += size.height * .1
            : savedItemPositionCounter += size.height * .2;
      }

      // get surah's verses
      for (var verseNumber = start; verseNumber <= end; verseNumber++) {
        String arabicText = quran.getVerse(surahNumber, verseNumber);
        String trText = trData[verseNumber - 1].translation ?? '';

        // if itemToScroll is null, we dont need to scroll
        if (itemToScroll != null) {
          if (itemToScroll.first == surahNumber &&
              itemToScroll.last == verseNumber) {
            savedItemPosition = savedItemPositionCounter;
          } else {
            savedItemPositionCounter +=
                _countHeightByText(arabicText, trText, size);
          }
        }
        verses.add(VerseData(
            verseNumber: verseNumber,
            arabicText: arabicText,
            trText: trText,
            isSaved: _isVerseSaved(savedVerses, surahNumber, verseNumber)));
      }

      data.surahs.add(SurahData(
          surahName: quran.getSurahNameArabic(surahNumber),
          surahNumber: surahNumber,
          verses: verses));
    }

    // to display surah name minus one surah height
    // if (itemToScroll != null && itemToScroll.last == 1) {
    //   savedItemPositionCounter -= itemToScroll.first == 9
    //       ? savedItemPositionCounter += size.height * .1
    //       : savedItemPositionCounter += size.height * .2;

    //   // reasain saved item position
    //   savedItemPosition = savedItemPositionCounter;
    // }
    data.scrollPosition = savedItemPosition;

    return data;
  }

  Future<List<SavedVerseSchema>> getSavedData() async {
    List<String> savedVerses = CacheHelper.getSavedVerses();

    List<SavedVerseSchema> data = <SavedVerseSchema>[];

    for (var savedIndex = 0; savedIndex < savedVerses.length; savedIndex++) {
      int surahNumber = int.parse(savedVerses[savedIndex].split('-').first);
      int verseNumber = int.parse(savedVerses[savedIndex].split('-').last);

      List<Verse> trVerses = await _getTrData(Translation.makarem, surahNumber);

      data.add(SavedVerseSchema(
          surahNumber: surahNumber,
          surahArabicName: quran.getSurahNameArabic(surahNumber),
          verseNumber: verseNumber,
          verseArabicText: quran.getVerse(surahNumber, verseNumber),
          translation: trVerses[verseNumber - 1].translation ?? ''));
    }

    return data;
  }

  //TODO: make it better
  double _countHeightByText(String arabicText, String trText, Size size) {
    // print('******arabicText****71***${arabicText}');
    // print('*******trText*****81**${trText.length}');
    // print('*******Size*******${size.width}');

    // // in default each item height is 200
    double defHeight = 40 + ((size.height * .02) * 4);
    double arabicTextLinesChar = (size.width / 100) * 17.4;
    double trTextLinesChar = (size.width / 100) * 20.25;

    double arabicTextLines = arabicText.length / arabicTextLinesChar;
    double trTextLines = trText.length / trTextLinesChar;

    for (var i = 0; i < arabicTextLines; i++) {
      // each arabic line height is 45.0
      defHeight += 60.0;
    }
    for (var i = 0; i < trTextLines; i++) {
      // each tr line height is 37.0
      defHeight += 45.0;
    }

    return defHeight;
  }

  Future<List<Verse>> _getTrData(Translation tr, int surahNumber) async {
    String response = tr == Translation.makarem
        ? await _readLocalJson(Translation.makarem.name!)
        : await _readLocalJson('');

    TrDataSuccessSchema data =
        TrDataSuccessSchema.fromJson(jsonDecode(response));

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
}
