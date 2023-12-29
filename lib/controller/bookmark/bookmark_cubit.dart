//
//  bookmark_cubit.dart
//  Created on 2023 18 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/cache_helper.dart';
import 'package:serat/services/helper/reading_page_schema.dart';
import 'package:serat/services/helper/saved_verses_schema.dart';
import 'package:quran/quran.dart' as quran;

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  AppRepository appRepository;
  BookmarkCubit({required this.appRepository})
      : super(const BookmarkState()
            .copyWith(status: () => BookmarkStatus.initial));

  String getSurahNameArabic(int surahNumber) =>
      quran.getSurahNameArabic(surahNumber);

  getAllSavedVerses() async {
    emit(state.copyWith(status: () => BookmarkStatus.loading));

    List<SavedVerseSchema> data = await appRepository.getSavedData();

    emit(state.copyWith(
        status: () => BookmarkStatus.verses, verses: () => data));
  }

  Future<void> removeVerse(int surahNumber, int verseNumber) async {
    await CacheHelper.removeVerse(surahNumber, verseNumber);
  }

  Future<void> saveVerse(int surahNumber, int verseNumber) async {
    await CacheHelper.saveVerse(surahNumber, verseNumber);
  }

  getPageData(
      {required int pageNumber,
      int? surahNumber,
      int? verseNumber,
      required Size size}) async {
    emit(state.copyWith(status: () => BookmarkStatus.loading));

    ReadingPageSchema data = await appRepository.getPageData(
        page: pageNumber, itemToScroll: [surahNumber, verseNumber], size: size);

    emit(state.copyWith(
        status: () => BookmarkStatus.page, pageData: () => data));
  }
}
