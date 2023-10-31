part of 'home_cubit.dart';

enum HomeStatus { initial, loading, btnNv }

class HomeState {
  const HomeState({this.status = HomeStatus.initial, this.btnNvIndex = 0});

  final HomeStatus status;
  final int btnNvIndex;

  HomeState copyWith({
    HomeStatus Function()? status,
    int Function()? btnNvIndex,
  }) {
    return HomeState(
      status: status != null ? status() : this.status,
      btnNvIndex: btnNvIndex != null ? btnNvIndex() : this.btnNvIndex,
    );
  }
}
