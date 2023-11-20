part of 'quran_cubit.dart';

enum QuranStatus {
  initial,
  loading,
  verses,
  page,
  juz,
  saving,
  lastSeendLoading,
  lastSeen
}

class QuranState {
  const QuranState(
      {this.status = QuranStatus.initial,
      this.verses,
      this.pageData,
      this.lastSeen});

  final QuranStatus status;
  final Map<String, dynamic>? verses;
  final Map<String, dynamic>? pageData;
  final Map<String, dynamic>? lastSeen;

  QuranState copyWith(
      {QuranStatus Function()? status,
      Map<String, dynamic> Function()? verses,
      Map<String, dynamic> Function()? pageData,
      lastSeen}) {
    return QuranState(
        status: status != null ? status() : this.status,
        verses: verses != null ? verses() : this.verses,
        pageData: pageData != null ? pageData() : this.pageData,
        lastSeen: lastSeen != null ? lastSeen() : this.lastSeen);
  }
}
