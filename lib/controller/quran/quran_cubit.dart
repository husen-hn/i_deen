import 'package:bloc/bloc.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());

  List<String> get getSurahNames => ["الفاتحة", "البقرة", "آل عمران", "النساء"];
}
