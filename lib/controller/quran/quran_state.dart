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
      {this.status = QuranStatus.initial, this.pageData, this.lastSeen});

  final QuranStatus status;

  final ReadingPageSchema? pageData;
  final Map<String, dynamic>? lastSeen;

  QuranState copyWith(
      {QuranStatus Function()? status,
      ReadingPageSchema Function()? pageData,
      lastSeen}) {
    return QuranState(
        status: status != null ? status() : this.status,
        pageData: pageData != null ? pageData() : this.pageData,
        lastSeen: lastSeen != null ? lastSeen() : this.lastSeen);
  }
}
