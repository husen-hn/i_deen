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
  const Ad({required this.appRepository, required this.adType, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<AdCubit>(
          create: (BuildContext context) =>
              AdCubit(appRepository: appRepository))
    ], child: AdView(adType: adType));
  }
}

class AdView extends StatelessWidget {
  final AdType adType;
  const AdView({required this.adType, super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AdCubit>().getNativeAd();

    return SizedBox(
      height: 380,
      child: adType == AdType.nativeAd
          ? BlocBuilder<AdCubit, AdState>(
              builder: (context, state) => state.status == AdStatus.loaded
                  ? NativeAdWidget(nativeAd: state.nativeAd!)
                  : const NativeAdWidgetShimmer())
          : const Text('error'),
    );
  }
}
