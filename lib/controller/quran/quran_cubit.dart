import 'package:bloc/bloc.dart';
import 'package:quran/quran.dart' as quran;

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  List<String> get getSurahNames => ["الفاتحة", "البقرة", "آل عمران", "النساء"];
  int get getTotalPagesCount => quran.totalPagesCount;
  int get getTotalJuzCount => quran.totalJuzCount;
}
