//
//  quran_cubit.dart
//  Created on 2023 31 October.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'dart:convert';

import 'package:adivery/adivery_ads.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/cache_helper.dart';
import 'package:serat/services/helper/reading_page_schema.dart';
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
  int starterSurahNumberByJuz(int juzNumber) =>
      appRepository.starterJuzData(juzNumber).surahNumber;
  int starterVerseNumberByJuz(int juzNumber) =>
      appRepository.starterJuzData(juzNumber).verseNumber;

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

    getNativeAd((nativeAd) => emit(state.copyWith(
        status: () => QuranStatus.lastSeen,
        lastSeen: () => data,
        nativeAd: () => nativeAd)));
  }

  getPageData(
      {required int pageNumber,
      int? surahNumber,
      int? verseNumber,
      required Size size}) async {
    emit(state.copyWith(status: () => QuranStatus.loading));

    ReadingPageSchema data = await appRepository.getPageData(
        page: pageNumber, itemToScroll: [surahNumber, verseNumber], size: size);

    emit(state.copyWith(status: () => QuranStatus.page, pageData: () => data));
  }

  getNativeAd(Function(NativeAd nativeAd) onAdLoaded) {
    late NativeAd nativeAd;
    nativeAd = NativeAd('ff454979-efaa-4ab8-b084-7db19e995d9b',
        onAdLoaded: () => onAdLoaded(nativeAd));

    nativeAd.loadAd();
  }

  // getNativeAd() {
  //   emit(state.copyWith(status: () => QuranStatus.loading));
  //   late NativeAd nativeAd;
  //   nativeAd = NativeAd('ff454979-efaa-4ab8-b084-7db19e995d9b',
  //       onAdLoaded: () => emit(state.copyWith(
  //           status: () => QuranStatus.nativeAd, nativeAd: () => nativeAd)));

  //   nativeAd.loadAd();
  // }
}
