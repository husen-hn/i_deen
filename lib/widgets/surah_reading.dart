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
import 'package:serat/widgets/widget_size.dart';

class SurahReading extends StatelessWidget {
  final int surahNumber;
  final String surahName;
  final List<VerseData> verses;
  final Function(
    int surahNumber,
    int verseNumber,
    bool isSaved,
  ) onTapSave;
  final Function(
          int surahNumber, int verseNumber, String arabicText, String trText)
      onTapShare;
  final Function(double height) onSizes;
  final Function(int surahNumber, int verseNumber) onVisible;

  const SurahReading(
      {super.key,
      required this.surahNumber,
      required this.surahName,
      required this.verses,
      required this.onTapSave,
      required this.onTapShare,
      required this.onSizes,
      required this.onVisible});

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
                        WidgetSize(
                          onChange: (Size? size) =>
                              onSizes((size?.height ?? 0) + 30),
                          child: SurahStarter(
                              size: MediaQuery.of(context).size,
                              surahName: surahName,
                              surahNumber: surahNumber),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        VerseItem(
                            juzNumber: verses[index].juzNumber,
                            surahNumber: surahNumber,
                            // display index for verses number on full surah, and display verses number on limited surah
                            verseNumber: verses[index].verseNumber,
                            arabicText: verses[index].arabicText,
                            translation: verses[index].trText,
                            isSaved: verses[index].isSaved,
                            onSaveTap: () => onTapSave(
                                surahNumber,
                                verses[index].verseNumber,
                                verses[index].isSaved),
                            onShare: () => onTapShare(
                                surahNumber,
                                verses[index].verseNumber,
                                verses[index].arabicText,
                                verses[index].trText),
                            onHeight: (double height) =>
                                onSizes(height), //itemSizes.add(height),
                            onVisible: () => onVisible(
                                surahNumber, verses[index].verseNumber))
                      ],
                    )
                  : VerseItem(
                      juzNumber: verses[index].juzNumber,
                      surahNumber: surahNumber,
                      // display index for verses number on full surah, and display verses number on limited surah
                      verseNumber: verses[index].verseNumber,
                      arabicText: verses[index].arabicText,
                      translation: verses[index].trText,
                      isSaved: verses[index].isSaved,
                      onSaveTap: () => onTapSave(surahNumber,
                          verses[index].verseNumber, verses[index].isSaved),
                      onShare: () => onTapShare(
                          surahNumber,
                          verses[index].verseNumber,
                          verses[index].arabicText,
                          verses[index].trText),
                      onHeight: (double height) =>
                          onSizes(height), //itemSizes.add(height),
                      onVisible: () =>
                          onVisible(surahNumber, verses[index].verseNumber));
        });
  }
}
