//
//  reading_page_schema.dart
//  Created on 2023 06 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

class ReadingPageSchema {
  int pageNumber;
  int? pageJuzNumber;
  double? scrollPosition;
  final List<SurahData> surahs;

  ReadingPageSchema(
      {required this.pageNumber,
      required this.pageJuzNumber,
      required this.scrollPosition,
      required this.surahs});
}

class SurahData {
  final String surahName;
  final int surahNumber;

  final List<VerseData> verses;

  const SurahData(
      {required this.surahName,
      required this.surahNumber,
      required this.verses});
}

class VerseData {
  final int verseNumber;
  final int? juzNumber;
  final String arabicText;
  final String trText;
  final bool isSaved;

  const VerseData(
      {required this.verseNumber,
      required this.juzNumber,
      required this.arabicText,
      required this.trText,
      required this.isSaved});
}
