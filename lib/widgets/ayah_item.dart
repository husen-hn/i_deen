//
//  ayah_item.dart
//  Created on 2023 06 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AyahItem extends StatelessWidget {
  final String? surahName;
  final int surahNumber;
  final int ayahNumber;
  final String arabicText;
  final String translation;
  final bool isSaved;
  final Function() onSaveTap;
  final Function() onVisible;

  const AyahItem({
    super.key,
    this.surahName,
    required this.surahNumber,
    required this.ayahNumber,
    required this.arabicText,
    required this.translation,
    required this.isSaved,
    required this.onSaveTap,
    required this.onVisible,
  });

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('$surahNumber-$ayahNumber'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage == 100) {
          onVisible();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // toolbar
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFF1219310D),
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
                            color: Color(0xFF863ED5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          ),
                          child: Center(
                              child: Text(
                            ayahNumber.toString(),
                            style: const TextStyle(
                                fontFamily: 'BTitr',
                                fontSize: 14,
                                color: Colors.white),
                          )),
                        ),
                        const SizedBox(width: 10),
                        surahName == null
                            ? Container()
                            : Text(surahName!,
                                style: const TextStyle(
                                    color: Color(0xFF863ED5),
                                    fontFamily: 'Amiri',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20))
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Image.asset('assets/icons/share.png'),
                          // Image.asset('assets/icons/play.png'),
                          InkWell(
                              onTap: onSaveTap,
                              child: isSaved
                                  ? Image.asset('assets/icons/saved.png',
                                      color: const Color(0xFF863ED5))
                                  : Image.asset('assets/icons/save.png',
                                      color: const Color(0xFF863ED5)))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            // text section
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
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            const Divider(
              height: 5,
              color: Color.fromRGBO(187, 196, 206, 0.35),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
          ],
        ),
      ),
    );
  }
}
