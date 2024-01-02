//
//  ad_cubit.dart
//  Created on 2023 28 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:adivery/adivery.dart';
import 'package:adivery/adivery_ads.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:serat/services/app/app_repository.dart';

part 'ad_state.dart';

class AdCubit extends Cubit<AdState> {
  AppRepository appRepository;
  AdCubit({required this.appRepository})
      : super(const AdState().copyWith(status: () => AdStatus.init));

  get _nativePlacementID => '4eb76b8d-d532-4efa-ad2e-65a9b5715c58';
  get _interstitialPlacementID => '39a0fce5-e61d-4d5d-a9cd-4576eb443874';

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

  getRewardedAd() {
    AdiveryPlugin.prepareRewardedAd(_interstitialPlacementID);
    AdiveryPlugin.isLoaded(_interstitialPlacementID).then((isLoaded) {
      if (isLoaded ?? false) {
        AdiveryPlugin.show(_interstitialPlacementID);
      }
    });
  }
}
