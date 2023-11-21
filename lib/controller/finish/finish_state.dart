part of 'finish_cubit.dart';

enum FinishStatus { initial, loading, page }

class FinishState {
  const FinishState({this.status = FinishStatus.initial, this.pageData});

  final FinishStatus status;
  final Map<String, dynamic>? pageData;

  FinishState copyWith(
      {FinishStatus Function()? status,
      Map<String, dynamic> Function()? pageData}) {
    return FinishState(
        status: status != null ? status() : this.status,
        pageData: pageData != null ? pageData() : this.pageData);
  }
}
