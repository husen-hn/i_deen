part of 'prayer_cubit.dart';

enum PrayerStatus { loading, done }

class PrayerState {
  const PrayerState({this.status = PrayerStatus.loading});

  final PrayerStatus status;

  PrayerState copyWith({
    PrayerStatus Function()? status,
    List<String> Function()? surahs,
  }) {
    return PrayerState(
      status: status != null ? status() : this.status,
    );
  }
}
