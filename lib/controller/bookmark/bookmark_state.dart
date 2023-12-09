part of 'bookmark_cubit.dart';

enum BookmarkStatus { initial, loading, verses, page }

class BookmarkState {
  const BookmarkState(
      {this.status = BookmarkStatus.initial, this.verses, this.pageData});

  final BookmarkStatus status;
  final List<SavedVerseSchema>? verses;
  final ReadingPageSchema? pageData;

  BookmarkState copyWith({
    BookmarkStatus Function()? status,
    List<SavedVerseSchema> Function()? verses,
    ReadingPageSchema Function()? pageData,
  }) {
    return BookmarkState(
        status: status != null ? status() : this.status,
        verses: verses != null ? verses() : this.verses,
        pageData: pageData != null ? pageData() : this.pageData);
  }
}
