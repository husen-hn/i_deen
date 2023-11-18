import 'package:bloc/bloc.dart';
import 'package:i_deen/services/helper/cache_helper.dart';
import 'package:quran/quran.dart' as quran;

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(const QuranState().copyWith());

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
  getVerses(int surahNumber, {List<int>? verseNumber}) {
    emit(state.copyWith(status: () => QuranStatus.loading));

    Map<String, dynamic> verses = {"verses": <String>[], "saved": <String>[]};
    if (verseNumber == null) {
      for (var verseIndex = 0;
          verseIndex < getVerseCount(surahNumber);
          verseIndex++) {
        verses["verses"].add(quran.getVerse(surahNumber, verseIndex + 1));
      }

      verses["saved"].addAll(CacheHelper.getSavedVerses());
    } else {
      for (var verseIndex = 0; verseIndex < verseNumber.length; verseIndex++) {
        if (verseIndex < getVerseCount(surahNumber)) {
          verses["verses"]
              .add(quran.getVerse(surahNumber, verseNumber[verseIndex]));
        }
      }
      verses["saved"].addAll(CacheHelper.getSavedVerses());
    }

    emit(
        state.copyWith(status: () => QuranStatus.verses, verses: () => verses));
  }

  getPageVerses(int pageNumber) {
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

      int start = pageData[i]['start'];
      int end = pageData[i]['end'];

      List<Map<int, String>> surahVerses = [];
      for (var verseNumber = start; verseNumber <= end; verseNumber++) {
        surahVerses
            .add({verseNumber: quran.getVerse(surahNumber, verseNumber)});
      }
      data['data']
          .add({'surahArabicName': surahArabicName, 'verses': surahVerses});
    }

    data["saved"].addAll(CacheHelper.getSavedVerses());

    emit(state.copyWith(status: () => QuranStatus.page, pageData: () => data));
  }

  getJuzVerses(int juzNumber) {
    emit(state.copyWith(status: () => QuranStatus.loading));
    Map<String, dynamic> data = {
      'data': <Map<String, dynamic>>[],
      'saved': <String>[]
    };

    Map<int, List<int>> juzData = quran.getSurahAndVersesFromJuz(juzNumber);

    for (var surahNumber in juzData.keys) {
      String surahArabicName = getSurahNameArabic(surahNumber);

      int start = juzData[surahNumber]!.first;
      int end = juzData[surahNumber]!.last;

      List<Map<int, String>> surahVerses = [];

      for (var verseNumber = start; verseNumber <= end; verseNumber++) {
        surahVerses
            .add({verseNumber: quran.getVerse(surahNumber, verseNumber)});
      }
      data['data'].add({
        'surahArabicName': surahArabicName,
        'surahNumber': surahNumber,
        'verses': surahVerses
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
}
