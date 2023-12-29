//
//  page_reading.dart
//  Created on 2023 09 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:serat/services/helper/reading_page_schema.dart';
import 'package:serat/widgets/surah_reading.dart';

class PageReading extends StatelessWidget {
  final ReadingPageSchema pageData;
  final Function(int surahNumber, int verseNumber, bool isSaved) onTapSave;
  final Function(
          int surahNumber, int verseNumber, String arabicText, String trText)
      onTapShare;
  final Function(int surahNumber, int verseNumber) onVerseVisible;

  PageReading(
      {super.key,
      required this.pageData,
      required this.onTapSave,
      required this.onTapShare,
      required this.onVerseVisible});

  final ScrollController _controller = ScrollController();

  void _scrollDown(double position) {
    _controller.animateTo(position,
        duration: const Duration(seconds: 1), curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scrollDown(pageData.scrollPosition ?? 0.0));

    return NotificationListener(
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 80),
          physics: const BouncingScrollPhysics(),
          controller: _controller,
          itemCount: pageData.surahs.length,
          itemBuilder: (context, index) {
            // Reading is a listview of surah's verses
            return SurahReading(
              surahNumber: pageData.surahs[index].surahNumber,
              surahName: pageData.surahs[index].surahName,
              verses: pageData.surahs[index].verses,
              onTapSave: onTapSave,
              onTapShare: onTapShare,
              onVisible: (surahNumber, verseNumber) =>
                  onVerseVisible(surahNumber, verseNumber),
            );
          }),
      onNotification: (t) {
        // if (t is ScrollEndNotification) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text(_controller.offset.toString())));
        // }

        return true;
      },
    );
  }
}
