//
//  quran_cubit.dart
//  Created on 2023 31 October.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/cache_helper.dart';
import 'package:serat/services/helper/tr_data_success_schema.dart';
import 'package:serat/services/helper/translation.dart';
import 'package:quran/quran.dart' as quran;

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  AppRepository appRepository;
  QuranCubit({required this.appRepository})
      : super(const QuranState().copyWith());

  int get getTotalPagesCount => quran.totalPagesCount;
  int get getTotalJuzCount => quran.totalJuzCount;
  int get getTotalSurahCount => quran.totalSurahCount;
  int getVerseCount(int surahNumber) => quran.getVerseCount(surahNumber);
  String getSurahNameArabic(int surahNumber) =>
      quran.getSurahNameArabic(surahNumber);
  String getSurahNameEnglish(int surahNumber) =>
      quran.getSurahNameEnglish(surahNumber);
  List<int> getSurahPages(int surahNumber) => quran.getSurahPages(surahNumber);
  String getPlaceOfRevelation(int surahNumber) =>
      quran.getPlaceOfRevelation(surahNumber);

  // get verses of a surah for all verses or spacific verses
  getVerses(int surahNumber, {List<int>? verseNumber}) async {
    emit(state.copyWith(status: () => QuranStatus.loading));

    List<Verse> trVerses = await getTrData(surahNumber);

    Map<String, dynamic> verses = {
      "verses": <String>[],
      "translations": <String>[],
      "saved": <String>[]
    };

    if (verseNumber == null) {
      for (var verseIndex = 0;
          verseIndex < getVerseCount(surahNumber);
          verseIndex++) {
        verses["verses"].add(quran.getVerse(surahNumber, verseIndex + 1));
        verses["translations"].add(trVerses[verseIndex].translation);
      }

      verses["saved"].addAll(CacheHelper.getSavedVerses());
    } else {
      for (var verseIndex = 0; verseIndex < verseNumber.length; verseIndex++) {
        if (verseIndex < getVerseCount(surahNumber)) {
          verses["verses"]
              .add(quran.getVerse(surahNumber, verseNumber[verseIndex]));
        }
        verses["translations"].add(trVerses[verseIndex].translation);
      }

      verses["saved"].addAll(CacheHelper.getSavedVerses());
    }

    emit(
        state.copyWith(status: () => QuranStatus.verses, verses: () => verses));
  }

  getPageVerses(int pageNumber) async {
    emit(state.copyWith(status: () => QuranStatus.loading));

    Map<String, dynamic> data = {
      'data': <Map<String, dynamic>>[],
      'saved': <String>[]
    };

    List<Map<String, dynamic>> pageData =
        quran.getPageData(pageNumber) as List<Map<String, dynamic>>;

    for (var i = 0; i < pageData.length; i++) {
      int surahNumber = pageData[i]['surah'];
      String surahArabicName = getSurahNameArabic(surahNumber);

      List<Verse> trVerses = await getTrData(surahNumber);

      int start = pageData[i]['start'];
      int end = pageData[i]['end'];

      List<Map<int, String>> surahVerses = [];
      List<Map<int, String>> translations = [];
      for (var verseNumber = start; verseNumber <= end; verseNumber++) {
        surahVerses
            .add({verseNumber: quran.getVerse(surahNumber, verseNumber)});
        translations.add({verseNumber: trVerses[verseNumber - 1].translation!});
      }
      data['data'].add({
        'surahArabicName': surahArabicName,
        'verses': surahVerses,
        'translation': translations
      });
    }

    data["saved"].addAll(CacheHelper.getSavedVerses());

    emit(state.copyWith(status: () => QuranStatus.page, pageData: () => data));
  }

  getJuzVerses(int juzNumber) async {
    emit(state.copyWith(status: () => QuranStatus.loading));
    Map<String, dynamic> data = {
      'data': <Map<String, dynamic>>[],
      'saved': <String>[]
    };

    Map<int, List<int>> juzData = quran.getSurahAndVersesFromJuz(juzNumber);

    for (var surahNumber in juzData.keys) {
      String surahArabicName = getSurahNameArabic(surahNumber);

      List<Verse> trVerses = await getTrData(surahNumber);

      int start = juzData[surahNumber]!.first;
      int end = juzData[surahNumber]!.last;

      List<Map<int, String>> surahVerses = [];
      List<Map<int, String>> translations = [];

      for (var verseNumber = start; verseNumber <= end; verseNumber++) {
        surahVerses
            .add({verseNumber: quran.getVerse(surahNumber, verseNumber)});
        translations.add({verseNumber: trVerses[verseNumber - 1].translation!});
      }
      data['data'].add({
        'surahArabicName': surahArabicName,
        'surahNumber': surahNumber,
        'verses': surahVerses,
        'translation': translations
      });
    }

    data["saved"].addAll(CacheHelper.getSavedVerses());

    emit(state.copyWith(status: () => QuranStatus.juz, pageData: () => data));
  }

  Future<void> saveVerse(int surahNumber, int verseNumber) async {
    await CacheHelper.saveVerse(surahNumber, verseNumber);
  }

  Future<void> removeVerse(int surahNumber, int verseNumber) async {
    await CacheHelper.removeVerse(surahNumber, verseNumber);
  }

  getLastSeen() {
    emit(state.copyWith(status: () => QuranStatus.lastSeendLoading));
    String? lastSeenData = CacheHelper.getLastSeen;
    Map<String, dynamic> data;
    if (lastSeenData != null) {
      int surahNumber = int.parse(json.decode(lastSeenData).split('-').first);
      int verseNumber = int.parse(json.decode(lastSeenData).split('-').last);

      data = {
        'surahName': quran.getSurahNameArabic(surahNumber),
        'verseNumber': verseNumber
      };
    } else {
      data = {'surahName': 'الفاتحة', 'verseNumber': 1};
    }

    emit(state.copyWith(
        status: () => QuranStatus.lastSeen, lastSeen: () => data));
  }

  int lastSurahNum = 1;
  int lastVerseNum = 1;
  void saveLastSeen(int surahNumber, int verseNumber, Duration duration) {
    lastSurahNum = surahNumber;
    lastVerseNum = verseNumber;

    Future.delayed(duration).then((value) async {
      await CacheHelper.saveLastSeen(lastSurahNum, lastVerseNum);
    });
  }

  Future<List<Verse>> getTrData(int surahNumber) async {
    TrDataSuccessSchema data =
        await appRepository.getTrData(Translation.makarem);

    return data.list[surahNumber - 1].verses;
  }
}
