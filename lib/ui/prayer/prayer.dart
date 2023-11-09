//
//  prayer.dart
//  Created on 2023 31 October.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:i_deen/controller/prayer/prayer_cubit.dart';
import 'package:i_deen/ui/prayer/prayer_shimmer.dart';

class Prayer extends StatelessWidget {
  const Prayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PrayerCubit>(create: (BuildContext context) => PrayerCubit())
    ], child: const PrayerView());
  }
}

class PrayerView extends StatelessWidget {
  const PrayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: context.read<PrayerCubit>().onWillPopWebView,
      child: Scaffold(
          body: SafeArea(
              child: BlocBuilder<PrayerCubit, PrayerState>(
        builder: (context, state) => Stack(
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
