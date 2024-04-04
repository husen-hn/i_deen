part of 'articles_cubit.dart';

enum ArticlesStatus { init, loading, done, error, checkConnection }

class ArticlesState {
  const ArticlesState(
      {this.status = ArticlesStatus.loading,
      this.response,
      this.isFirstPage,
      this.networkConnection,
      this.vpnConnection});

  final ArticlesStatus status;
  final List<ArticlesSuccessSchema>? response;
  final bool? isFirstPage;
  final bool? networkConnection;
  final bool? vpnConnection;

  ArticlesState copyWith({
    ArticlesStatus Function()? status,
    List<ArticlesSuccessSchema> Function()? response,
    bool Function()? isFirstPage,
    bool Function()? networkConnection,
    bool Function()? vpnConnection,
  }) {
    return ArticlesState(
        status: status != null ? status() : this.status,
        response: response != null ? response() : this.response,
        isFirstPage: isFirstPage != null ? isFirstPage() : this.isFirstPage,
        networkConnection: networkConnection != null
            ? networkConnection()
            : this.networkConnection,
        vpnConnection:
            vpnConnection != null ? vpnConnection() : this.vpnConnection);
  }
}
