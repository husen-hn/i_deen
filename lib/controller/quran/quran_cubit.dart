import 'package:bloc/bloc.dart';
import 'package:quran/quran.dart' as quran;

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  int get getTotalPagesCount => quran.totalPagesCount;
  int get getTotalJuzCount => quran.totalJuzCount;
  int get getTotalSurahCount => quran.totalSurahCount;
  getVerseCount(int surahNumber) => quran.getVerseCount(surahNumber);
  getSurahNameArabic(int surahNumber) => quran.getSurahNameArabic(surahNumber);
  List<int> get getTotalMadaniSurahs => [
        2,
        3,
        4,
        5,
        8,
        9,
        24,
        33,
        47,
        48,
        49,
        57,
        58,
        59,
        60,
        62,
        63,
        65,
        66,
        110
      ];
  List<int> get getTotalXORMadaniMacciSurahs =>
      [1, 13, 55, 61, 64, 83, 97, 98, 99, 112, 113, 114];
}
