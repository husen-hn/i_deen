part of 'quran_cubit.dart';

enum QuranStatus { initial, loading, surahs }

class QuranState {
  const QuranState({this.status = QuranStatus.initial, this.surahs});

  final QuranStatus status;
  final List<String>? surahs;

  QuranState copyWith({
    QuranStatus Function()? status,
    List<String> Function()? surahs,
  }) {
    return QuranState(
      status: status != null ? status() : this.status,
      surahs: surahs != null ? surahs() : this.surahs,
    );
  }
}
