part of 'articles_cubit.dart';

enum ArticlesStatus { init, loading, done, error }

class ArticlesState {
  const ArticlesState(
      {this.status = ArticlesStatus.loading, this.response, this.isFirstPage});

  final ArticlesStatus status;
  final List<ArticlesSuccessSchema>? response;
  final bool? isFirstPage;

  ArticlesState copyWith(
      {ArticlesStatus Function()? status,
      List<ArticlesSuccessSchema> Function()? response,
      bool Function()? isFirstPage}) {
    return ArticlesState(
        status: status != null ? status() : this.status,
        response: response != null ? response() : this.response,
        isFirstPage: isFirstPage != null ? isFirstPage() : this.isFirstPage);
  }
}
