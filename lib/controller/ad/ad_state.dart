part of 'ad_cubit.dart';

enum AdStatus { init, loading, loaded, error }

class AdState {
  const AdState({this.status = AdStatus.init, this.nativeAd, this.errorMsg});

  final AdStatus status;
  final NativeAd? nativeAd;
  final String? errorMsg;

  AdState copyWith(
      {AdStatus Function()? status,
      NativeAd Function()? nativeAd,
      String Function()? errorMsg}) {
    return AdState(
        status: status != null ? status() : this.status,
        nativeAd: nativeAd != null ? nativeAd() : this.nativeAd,
        errorMsg: errorMsg != null ? errorMsg() : this.errorMsg);
  }
}
