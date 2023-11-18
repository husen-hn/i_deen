part of 'bookmark_cubit.dart';

enum BookmarkStatus { initial, loading, verses }

class BookmarkState {
  const BookmarkState({this.status = BookmarkStatus.initial, this.verses});

  final BookmarkStatus status;
  final List<Map<String, dynamic>>? verses;

  BookmarkState copyWith({
    BookmarkStatus Function()? status,
    List<Map<String, dynamic>> Function()? verses,
  }) {
    return BookmarkState(
      status: status != null ? status() : this.status,
      verses: verses != null ? verses() : this.verses,
    );
  }
}
