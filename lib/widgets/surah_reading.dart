//
//  surah_reading.dart
//  Created on 2023 06 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:serat/services/helper/reading_page_schema.dart';
import 'package:serat/widgets/surah_starter.dart';
import 'package:serat/widgets/verse_item.dart';

class SurahReading extends StatelessWidget {
  final int surahNumber;
  final String surahName;
  final List<VerseData> verses;

  final Function(int surahNumber, int verseNumber, bool isSaved) onTapSave;

  const SurahReading(
      {super.key,
      required this.surahNumber,
      required this.surahName,
      required this.verses,
      required this.onTapSave});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: verses.length,
        itemBuilder: (context, index) {
          return
              // if verse number is 1, display surah name
              verses[index].verseNumber == 1
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SurahStarter(
                            size: MediaQuery.of(context).size,
                            surahName: surahName,
                            surahNumber: surahNumber),
                        const SizedBox(
                          height: 30,
                        ),
                        VerseItem(
                          surahNumber: surahNumber,
                          // display index for verses number on full surah, and display verses number on limited surah
                          ayahNumber: verses[index].verseNumber,
                          arabicText: verses[index].arabicText,
                          translation: verses[index].trText,
                          isSaved: verses[index].isSaved,
                          onSaveTap: () => onTapSave(surahNumber,
                              verses[index].verseNumber, verses[index].isSaved),
                        )
                      ],
                    )
                  : VerseItem(
                      surahNumber: surahNumber,
                      // display index for verses number on full surah, and display verses number on limited surah
                      ayahNumber: verses[index].verseNumber,
                      arabicText: verses[index].arabicText,
                      translation: verses[index].trText,
                      isSaved: verses[index].isSaved,
                      onSaveTap: () => onTapSave(surahNumber,
                          verses[index].verseNumber, verses[index].isSaved),
                    );
        });
  }
}
