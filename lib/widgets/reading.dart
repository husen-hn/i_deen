//
//  reading.dart
//  Created on 2023 06 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/services/helper/serat_icon.dart';
import 'package:serat/services/helper/verses_schema.dart';
import 'package:serat/widgets/ayah_item.dart';

class Reading extends StatelessWidget {
  final List<VersesSchema> verses;
  final Function(int surahNumber, int verseNumber) onTapSave;

  const Reading({super.key, required this.verses, required this.onTapSave});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        physics: const BouncingScrollPhysics(),
        itemCount: verses.length,
        itemBuilder: (context, index) {
          return
              // if verse number is 1, display surah name
              verses[index].verseNumber == 1
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 30),
                      child: _surahName(MediaQuery.of(context).size,
                          verses[index].surahName, verses[index].surahNumber),
                    )
                  : AyahItem(
                      surahNumber: verses[index].surahNumber,
                      // display index for verses number on full surah, and display verses number on limited surah
                      ayahNumber: verses[index].verseNumber,
                      arabicText: verses[index].arabicText,
                      translation: verses[index].trText,
                      isSaved: verses[index].isSaved,
                      onSaveTap: () => onTapSave(
                          verses[index].surahNumber, verses[index].verseNumber),
                    );
        });
  }

  _surahName(Size size, String surahName, int surahNumber) => Container(
        width: size.width * .5,
        height: surahNumber == 9 ? size.height * .1 : size.height * .2,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          gradient: const LinearGradient(
              colors: [Color(0xFF9055FF), Color(0xFFDF98FA)]),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF9055FF).withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 20))
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Image.asset(SeratIcon.verse.name, color: Colors.white),
                Text(
                  surahName,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: SeratFont.amiri.name,
                      fontWeight: FontWeight.w800,
                      fontSize: 30),
                ),
                Image.asset(SeratIcon.verse.name, color: Colors.white)
              ]),
              // to not display besmelah in tobe surah
              surahNumber == 9
                  ? Container()
                  : Image.asset(
                      SeratIcon.nameOfGod.name,
                      color: Colors.white,
                      width: size.width * .6,
                    ),
            ],
          ),
        ),
      );
}
