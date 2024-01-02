//
//  verse_item_expansion.dart
//  Created on 2023 05 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/services/helper/serat_icon.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VerseItemExpansion extends StatelessWidget {
  final String? surahName;
  final int surahNumber;
  final int ayahNumber;
  final String arabicText;
  final String translation;
  final bool isSaved;
  final Function() onSaveTap;
  final Function()? onVisible;
  final Function()? onVerseTap;

  const VerseItemExpansion(
      {super.key,
      this.surahName,
      required this.surahNumber,
      required this.ayahNumber,
      required this.arabicText,
      required this.translation,
      required this.isSaved,
      required this.onSaveTap,
      this.onVisible,
      this.onVerseTap});

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('$surahNumber-$ayahNumber'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage == 100) {
          onVisible!();
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          backgroundColor: const Color.fromRGBO(25, 49, 13, 0.071),
          collapsedBackgroundColor: const Color.fromRGBO(25, 49, 13, 0.071),
          collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          maintainState: true,
          collapsedIconColor: const Color.fromRGBO(153, 78, 248, 1),
          iconColor: const Color.fromRGBO(153, 78, 248, 1),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 12.0),
          expandedAlignment: Alignment.centerRight,
          title: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(134, 62, 213, 1),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Center(
                            child: Text(
                          ayahNumber.toString(),
                          style: TextStyle(
                              fontFamily: SeratFont.bTitr.name,
                              fontSize: 14,
                              color: Colors.white),
                        )),
                      ),
                      const SizedBox(width: 10),
                      surahName == null
                          ? Container()
                          : Text(surahName!,
                              style: TextStyle(
                                  color: const Color.fromRGBO(134, 62, 213, 1),
                                  fontFamily: SeratFont.amiri.name,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20))
                    ],
                  ),
                  InkWell(
                      onTap: onSaveTap,
                      child: SizedBox(
                        width: 25,
                        child: Image.asset(SeratIcon.bin.name,
                            color: const Color.fromRGBO(134, 62, 213, 1)),
                      ))
                ],
              ),
            ),
          ),
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: onVerseTap,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Text(
                    arabicText,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        color: Color(0xFF240F4F),
                        fontFamily: 'QuranTaha',
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        height: 2),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .02),
                  Text(translation,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          color: Color(0xFF240F4F),
                          fontFamily: 'BZar',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          height: 2)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
