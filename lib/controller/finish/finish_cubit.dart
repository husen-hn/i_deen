//
//  finish_cubit.dart
//  Created on 2023 20 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/cache_helper.dart';
import 'package:quran/quran.dart' as quran;
import 'package:serat/services/helper/reading_page_schema.dart';

part 'finish_state.dart';

class FinishCubit extends Cubit<FinishState> {
  AppRepository appRepository;
  FinishCubit({required this.appRepository})
      : super(const FinishState().copyWith());

  ScrollController scrollController = ScrollController();

  get totalPagesCount => quran.totalPagesCount;

  String getSurahNameArabic(int surahNumber) =>
      quran.getSurahNameArabic(surahNumber);

  // getPageData(int pageNumber) {
  //   emit(state.copyWith(status: () => FinishStatus.loading));

  //   Map<String, dynamic> data = {'data': <Map<String, dynamic>>[], 'page': int};

  //   List<Map<String, dynamic>> pageData =
  //       quran.getPageData(pageNumber) as List<Map<String, dynamic>>;

  //   for (var i = 0; i < pageData.length; i++) {
  //     int surahNumber = pageData[i]['surah'];
  //     String surahArabicName = getSurahNameArabic(surahNumber);

  //     int start = pageData[i]['start'];
  //     int end = pageData[i]['end'];

  //     List<Map<int, String>> surahVerses = [];
  //     for (var verseNumber = start; verseNumber <= end; verseNumber++) {
  //       surahVerses
  //           .add({verseNumber: quran.getVerse(surahNumber, verseNumber)});
  //     }
  //     data['data'].add({
  //       'surahNumber': surahNumber,
  //       'surahArabicName': surahArabicName,
  //       'verses': surahVerses
  //     });
  //   }
  //   data['page'] = pageNumber;

  //   emit(state.copyWith(status: () => FinishStatus.page, pageData: () => data));
  // }

  getPageData({
    required int pageNumber,
  }) async {
    emit(state.copyWith(status: () => FinishStatus.loading));

    ReadingPageSchema data = await appRepository.getPageData(page: pageNumber);

    print('***********$data');

    emit(state.copyWith(status: () => FinishStatus.page, pageData: () => data));
  }

  int get getLastPageNumber => CacheHelper.getLastPage();

  setLastPage(int pageNumber) => CacheHelper.saveLastPage(pageNumber);
}
