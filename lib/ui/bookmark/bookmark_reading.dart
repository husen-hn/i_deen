//
//  bookmark_reading.dart
//  Created on 2023 06 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/services/helper/serat_icon.dart';
import 'package:serat/services/helper/verses_schema.dart';
import 'package:serat/widgets/reading.dart';

class BookmarkReading extends StatelessWidget {
  final String pageSurahName;
  final List<VersesSchema> verses;
  final Function(int surahNumber, int verseNumber) onTapSave;

  const BookmarkReading(
      {super.key,
      required this.pageSurahName,
      required this.verses,
      required this.onTapSave});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageSurahName,
          style: TextStyle(
              fontFamily: SeratFont.bZar.name,
              fontWeight: FontWeight.w900,
              fontSize: 20),
        ),
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          child: Image.asset(SeratIcon.backRTL.name),
          onTap: () => context.pop(),
        ),
      ),
      body: Reading(verses: verses, onTapSave: onTapSave),
    );
  }
}
