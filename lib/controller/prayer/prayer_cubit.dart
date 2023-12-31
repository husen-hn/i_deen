//
//  prayer_cubit.dart
//  Created on 2023 12 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:bloc/bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:serat/services/app/app_repository.dart';

part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  AppRepository appRepository;
  PrayerCubit({required this.appRepository})
      : super(const PrayerState().copyWith());

  String baseLink = 'https://www.namaz.ir/news/notes/';

  late InAppWebViewController inAppWebViewController;

  onWebCreatedWebView(InAppWebViewController controller) {
    inAppWebViewController = controller;
  }

  onProgressChangedWebView(InAppWebViewController controller, int progress) {
    if (progress > 65) {
      emit(state.copyWith(
        status: () => PrayerStatus.done,
      ));
    }
  }
}
