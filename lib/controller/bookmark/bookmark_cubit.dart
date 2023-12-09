//
//  bookmark_cubit.dart
//  Created on 2023 18 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:bloc/bloc.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/cache_helper.dart';
import 'package:serat/services/helper/reading_page_schema.dart';
import 'package:quran/quran.dart' as quran;
import 'package:serat/services/helper/saved_verses_schema.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  AppRepository appRepository;
  BookmarkCubit({required this.appRepository})
      : super(const BookmarkState()
            .copyWith(status: () => BookmarkStatus.initial));

  getAllSavedVerses() async {
    emit(state.copyWith(status: () => BookmarkStatus.loading));

    List<SavedVerseSchema> data = await appRepository.getSavedData();

    emit(state.copyWith(
        status: () => BookmarkStatus.verses, verses: () => data));
  }

  Future<void> removeVerse(int surahNumber, int verseNumber) async {
    await CacheHelper.removeVerse(surahNumber, verseNumber);
  }

  // get data of page is saved
  getSavedPageData(int surahNumber, int verseNumber) async {
    emit(state.copyWith(status: () => BookmarkStatus.loading));

    int page = quran.getPageNumber(surahNumber, verseNumber);

    ReadingPageSchema data = await appRepository.getPageData(page);

    emit(state.copyWith(
        status: () => BookmarkStatus.page, pageData: () => data));
  }
}
