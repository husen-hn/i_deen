class SavedVerseSchema {
  final int surahNumber;
  final String surahArabicName;
  final int verseNumber;
  final String verseArabicText;
  final String translation;

  const SavedVerseSchema(
      {required this.surahNumber,
      required this.surahArabicName,
      required this.verseNumber,
      required this.verseArabicText,
      required this.translation});
}
