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
  Future<ReadingPageSchema> getPageData(int page) async {
    ReadingPageSchema data =
        ReadingPageSchema(pageNumber: page, surahs: <SurahData>[]);

    // [{surah: 112, start: 1, end: 5}, {surah: 113, start: 1, end: 4}]
    List<Map<String, dynamic>> pageData =
        quran.getPageData(page) as List<Map<String, dynamic>>;

    // get surahs
    for (var i = 0; i < pageData.length; i++) {
      int surahNumber = pageData[i]['surah'];
      int start = pageData[i]['start'];
      int end = pageData[i]['end'];

      List<Verse> trData = await _getTrData(Translation.makarem, surahNumber);

      List<VerseData> verses = [];
      // get surah's verses
      for (var verseNumber = start; verseNumber <= end; verseNumber++) {
        verses.add(VerseData(
            verseNumber: verseNumber,
            arabicText: quran.getVerse(surahNumber, verseNumber),
            trText: trData[verseNumber - 1].translation ?? '',
            isSaved: true));
      }

      data.surahs.add(SurahData(
          surahName: quran.getSurahNameArabic(surahNumber),
          surahNumber: surahNumber,
          verses: verses));
    }

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
}
