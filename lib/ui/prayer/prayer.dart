//
//  prayer.dart
//  Created on 2023 31 October.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:serat/controller/prayer/prayer_cubit.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/ui/prayer/prayer_shimmer.dart';

class Prayer extends StatelessWidget {
  final AppRepository appRepository;
  const Prayer({required this.appRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PrayerCubit>(
          create: (BuildContext context) =>
              PrayerCubit(appRepository: appRepository))
    ], child: PrayerView(appRepository: appRepository));
  }
}

class PrayerView extends StatelessWidget {
  final AppRepository appRepository;
  const PrayerView({required this.appRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
          body: SafeArea(
              child: BlocBuilder<PrayerCubit, PrayerState>(
        builder: (context, state) => Stack(
          alignment: AlignmentDirectional.center,
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                  url: Uri.parse(context.read<PrayerCubit>().baseLink)),
              onWebViewCreated: context.read<PrayerCubit>().onWebCreatedWebView,
              onProgressChanged:
                  context.read<PrayerCubit>().onProgressChangedWebView,
            ),
            state.status == PrayerStatus.done
                ? Container()
                : const PrayerShimmer()
          ],
        ),
      ))),
    );
  }
}
