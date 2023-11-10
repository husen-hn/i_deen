import 'package:bloc/bloc.dart';
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

    List<String> verses = [];
    print('************ ${getVerseCount(surahNumber)}');
    if (verseNumber == null) {
      for (var verseIndex = 0;
          verseIndex < getVerseCount(surahNumber);
          verseIndex++) {
        verses.add(quran.getVerse(surahNumber, verseIndex + 1));
      }
    } else {
      for (var verseIndex = 0; verseIndex < verseNumber.length; verseIndex++) {
        if (verseIndex < getVerseCount(surahNumber)) {
          verses.add(quran.getVerse(surahNumber, verseNumber[verseIndex]));
        }
      }
    }

    emit(
        state.copyWith(status: () => QuranStatus.verses, verses: () => verses));
  }
}
