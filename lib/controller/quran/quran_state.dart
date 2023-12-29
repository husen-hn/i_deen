part of 'quran_cubit.dart';

enum QuranStatus {
  initial,
  loading,
  verses,
  page,
  juz,
  saving,
  lastSeendLoading,
  lastSeen,
  nativeAd
}

class QuranState {
  const QuranState(
      {this.status = QuranStatus.initial,
      this.pageData,
      this.lastSeen,
      this.nativeAd});

  final QuranStatus status;

  final ReadingPageSchema? pageData;
  final Map<String, dynamic>? lastSeen;
  final NativeAd? nativeAd;

  QuranState copyWith({
    QuranStatus Function()? status,
    ReadingPageSchema Function()? pageData,
    Map<String, dynamic> Function()? lastSeen,
    NativeAd Function()? nativeAd,
  }) {
    return QuranState(
      status: status != null ? status() : this.status,
      pageData: pageData != null ? pageData() : this.pageData,
      lastSeen: lastSeen != null ? lastSeen() : this.lastSeen,
      nativeAd: nativeAd != null ? nativeAd() : this.nativeAd,
    );
  }
}
