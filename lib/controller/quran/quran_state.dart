part of 'quran_cubit.dart';

enum QuranStatus { initial, loading, verses }

class QuranState {
  const QuranState({this.status = QuranStatus.initial, this.verses});

  final QuranStatus status;
  final List<String>? verses;

  QuranState copyWith({
    QuranStatus Function()? status,
    List<String> Function()? verses,
  }) {
    return QuranState(
      status: status != null ? status() : this.status,
      verses: verses != null ? verses() : this.verses,
    );
  }
}
