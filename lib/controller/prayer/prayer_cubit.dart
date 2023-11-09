import 'package:bloc/bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit() : super(const PrayerState().copyWith());

  String baseLink = 'https://www.namaz.ir/news/notes/';

  late InAppWebViewController inAppWebViewController;

  Future<bool> onWillPopWebView() async {
    bool isLastPage = await inAppWebViewController.canGoBack();

    if (isLastPage) {
      inAppWebViewController.goBack();
      return false;
    }
    return false;
  }

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
