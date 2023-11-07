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

  getSurahs(surahNumber) {
    emit(state.copyWith(status: () => QuranStatus.loading));
    List<String> surahs = [];
    for (var verseNumber = 0;
        verseNumber < getVerseCount(surahNumber);
        verseNumber++) {
      surahs.add(quran.getVerse(surahNumber, verseNumber + 1));
      emit(state.copyWith(
          status: () => QuranStatus.surahs, surahs: () => surahs));
    }
  }
}
