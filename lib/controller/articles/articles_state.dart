part of 'articles_cubit.dart';

enum ArticlesStatus { loading, done }

class ArticlesState {
  const ArticlesState({this.status = ArticlesStatus.loading, this.response});

  final ArticlesStatus status;
  final Either<ArticlesFailSchema, List<ArticlesSuccessSchema>>? response;

  ArticlesState copyWith({
    ArticlesStatus Function()? status,
    Either<ArticlesFailSchema, List<ArticlesSuccessSchema>> Function()?
        response,
  }) {
    return ArticlesState(
        status: status != null ? status() : this.status,
        response: response != null ? response() : this.response);
  }
}
