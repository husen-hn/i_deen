//
//  bookmark_cubit.dart
//  Created on 2023 18 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:bloc/bloc.dart';
import 'package:i_deen/services/helper/cache_helper.dart';
import 'package:quran/quran.dart' as quran;

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit()
      : super(const BookmarkState()
            .copyWith(status: () => BookmarkStatus.initial));

  getAllSavedVerses() {
    emit(state.copyWith(status: () => BookmarkStatus.loading));
    List<String> savedVerses = CacheHelper.getSavedVerses();

    List<Map<String, dynamic>> data = [];
    for (var savedIndex = 0; savedIndex < savedVerses.length; savedIndex++) {
      int surahNumber = int.parse(savedVerses[savedIndex].split('-').first);
      int verseNumber = int.parse(savedVerses[savedIndex].split('-').last);

      data.add({
        'surahNumber': surahNumber,
        'verseNumber': verseNumber,
        'surahArabicName': quran.getSurahNameArabic(surahNumber),
        'verse': quran.getVerse(surahNumber, verseNumber),
      });
    }

    emit(state.copyWith(
        status: () => BookmarkStatus.verses, verses: () => data));
  }

  Future<void> removeVerse(int surahNumber, int verseNumber) async {
    await CacheHelper.removeVerse(surahNumber, verseNumber);
  }
}
