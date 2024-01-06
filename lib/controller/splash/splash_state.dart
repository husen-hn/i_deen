part of 'splash_cubit.dart';

enum SplashStatus { initial, loading, loaded }

class SplashState {
  const SplashState(
      {this.status = SplashStatus.initial,
      this.networkConnection,
      this.vpnConnection});

  final SplashStatus status;
  final bool? networkConnection;
  final bool? vpnConnection;

  SplashState copyWith({
    SplashStatus Function()? status,
    bool Function()? networkConnection,
    bool Function()? vpnConnection,
  }) {
    return SplashState(
      status: status != null ? status() : this.status,
      networkConnection: networkConnection != null
          ? networkConnection()
          : this.networkConnection,
      vpnConnection:
          vpnConnection != null ? vpnConnection() : this.vpnConnection,
    );
  }
}
