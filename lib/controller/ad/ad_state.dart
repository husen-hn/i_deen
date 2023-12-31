part of 'ad_cubit.dart';

enum AdStatus { init, loading, loaded, error }

class AdState {
  const AdState(
      {this.status = AdStatus.init,
      this.nativeAd,
      this.bannerAd,
      this.errorMsg});

  final AdStatus status;
  final NativeAd? nativeAd;
  final Widget? bannerAd;
  final String? errorMsg;

  AdState copyWith(
      {AdStatus Function()? status,
      NativeAd Function()? nativeAd,
      Widget Function()? bannerAd,
      String Function()? errorMsg}) {
    return AdState(
        status: status != null ? status() : this.status,
        nativeAd: nativeAd != null ? nativeAd() : this.nativeAd,
        bannerAd: bannerAd != null ? bannerAd() : this.bannerAd,
        errorMsg: errorMsg != null ? errorMsg() : this.errorMsg);
  }
}
