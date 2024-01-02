//
//  ad.dart
//  Created on 2023 28 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serat/controller/ad/ad_cubit.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/ad_type.dart';
import 'package:serat/widgets/native_ad_widget.dart';
import 'package:serat/widgets/native_ad_widget_shimmer.dart';

class Ad extends StatelessWidget {
  final AppRepository appRepository;
  final AdType adType;
  final double? height;
  const Ad(
      {required this.appRepository,
      required this.adType,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AdCubit>(
              create: (BuildContext context) =>
                  AdCubit(appRepository: appRepository))
        ],
        child: AdView(
            appRepository: appRepository,
            adType: adType,
            height: height ?? 380));
  }
}

class AdView extends StatelessWidget {
  final AppRepository appRepository;
  final AdType adType;
  final double height;
  const AdView(
      {required this.appRepository,
      required this.adType,
      required this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (adType == AdType.nativeAd) {
      context.read<AdCubit>().getNativeAd();
    }

    return BlocBuilder<AdCubit, AdState>(
        builder: (context, state) => adType == AdType.nativeAd
            ? state.status == AdStatus.loading
                ? SizedBox(height: height, child: const NativeAdWidgetShimmer())
                : state.status == AdStatus.loaded
                    ? SizedBox(
                        height: height,
                        child: NativeAdWidget(nativeAd: state.nativeAd!))
                    : Container()
            : const Text('Error'));
  }
}
