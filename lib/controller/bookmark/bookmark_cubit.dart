//
//  bookmark_cubit.dart
//  Created on 2023 18 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:bloc/bloc.dart';
import 'package:i_deen/services/app/app_repository.dart';
import 'package:i_deen/services/helper/cache_helper.dart';
import 'package:i_deen/services/helper/tr_data_success_schema.dart';
import 'package:i_deen/services/helper/translation.dart';
import 'package:quran/quran.dart' as quran;

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  AppRepository appRepository;
  BookmarkCubit({required this.appRepository})
      : super(const BookmarkState()
            .copyWith(status: () => BookmarkStatus.initial));

  getAllSavedVerses() async {
    emit(state.copyWith(status: () => BookmarkStatus.loading));
    List<String> savedVerses = CacheHelper.getSavedVerses();

    List<Map<String, dynamic>> data = [];
    for (var savedIndex = 0; savedIndex < savedVerses.length; savedIndex++) {
      int surahNumber = int.parse(savedVerses[savedIndex].split('-').first);
      int verseNumber = int.parse(savedVerses[savedIndex].split('-').last);

      List<Verse> trVerses = await getTrData(surahNumber);

      data.add({
        'surahNumber': surahNumber,
        'verseNumber': verseNumber,
        'surahArabicName': quran.getSurahNameArabic(surahNumber),
        'verse': quran.getVerse(surahNumber, verseNumber),
        'translation': trVerses[verseNumber - 1].translation
      });
    }

    emit(state.copyWith(
        status: () => BookmarkStatus.verses, verses: () => data));
  }

  Future<void> removeVerse(int surahNumber, int verseNumber) async {
    await CacheHelper.removeVerse(surahNumber, verseNumber);
  }

  Future<List<Verse>> getTrData(int surahNumber) async {
    TrDataSuccessSchema data =
        await appRepository.getTrData(Translation.makarem);

    return data.list[surahNumber - 1].verses;
  }
}
