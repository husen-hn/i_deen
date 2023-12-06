//
//  verses_schema.dart
//  Created on 2023 06 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

class VersesSchema {
  final String surahName;
  final int surahNumber;
  final int verseNumber;
  final String arabicText;
  final String trText;
  final bool isSaved;

  const VersesSchema(
      {required this.surahName,
      required this.surahNumber,
      required this.verseNumber,
      required this.arabicText,
      required this.trText,
      required this.isSaved});
}
