//
//  ad_cubit.dart
//  Created on 2023 28 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:adivery/adivery_ads.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:serat/services/app/app_repository.dart';

part 'ad_state.dart';

class AdCubit extends Cubit<AdState> {
  AppRepository appRepository;
  AdCubit({required this.appRepository})
      : super(const AdState().copyWith(status: () => AdStatus.init));

  get _nativePlacementID => 'ff454979-efaa-4ab8-b084-7db19e995d9b';
  get _bannerPlacementID => '22895fca-c425-47c2-9675-c19acd2fcb2d';

  getNativeAd() {
    emit(state.copyWith(status: () => AdStatus.loading));

    late NativeAd nativeAd;

    nativeAd = NativeAd(
      _nativePlacementID,
      onAdLoaded: () => emit(
        state.copyWith(status: () => AdStatus.loaded, nativeAd: () => nativeAd),
      ),
      onError: (String reason) {
        emit(
          state.copyWith(status: () => AdStatus.error, errorMsg: () => reason),
        );
      },
    );

    nativeAd.loadAd();
  }

  getBannerAd() {
    emit(state.copyWith(status: () => AdStatus.loading));

    late BannerAd bannerAd;

    bannerAd = BannerAd(
      _bannerPlacementID,
      BannerAdSize.LARGE_BANNER,
      onAdLoaded: (ad) => emit(
        state.copyWith(status: () => AdStatus.loaded, bannerAd: () => bannerAd),
      ),
      onError: (Ad ad, String reason) {
        emit(
          state.copyWith(status: () => AdStatus.error, errorMsg: () => reason),
        );
      },
    );
  }
}
