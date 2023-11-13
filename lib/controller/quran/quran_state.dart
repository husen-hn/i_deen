part of 'quran_cubit.dart';

enum QuranStatus { initial, loading, verses, page }

class QuranState {
  const QuranState(
      {this.status = QuranStatus.initial, this.verses, this.pageData});

  final QuranStatus status;
  final List<String>? verses;
  final List<Map<String, dynamic>>? pageData;

  QuranState copyWith({
    QuranStatus Function()? status,
    List<String> Function()? verses,
    List<Map<String, dynamic>> Function()? pageData,
  }) {
    return QuranState(
      status: status != null ? status() : this.status,
      verses: verses != null ? verses() : this.verses,
      pageData: pageData != null ? pageData() : this.pageData,
    );
  }
}
