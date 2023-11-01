part of 'app_cubit.dart';

enum AppStatus { initial, loading, langCode }

class AppState {
  const AppState({this.status = AppStatus.initial, this.langCode});

  final AppStatus status;
  final String? langCode;

  AppState copyWith({
    AppStatus Function()? status,
    String Function()? langCode,
  }) {
    return AppState(
      status: status != null ? status() : this.status,
      langCode: langCode != null ? langCode() : this.langCode,
    );
  }
}
