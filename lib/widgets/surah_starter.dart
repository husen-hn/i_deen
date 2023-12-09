//
//  surah_starter.dart
//  Created on 2023 09 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/services/helper/serat_icon.dart';

class SurahStarter extends StatelessWidget {
  final Size size;
  final String surahName;
  final int surahNumber;
  const SurahStarter(
      {super.key,
      required this.size,
      required this.surahName,
      required this.surahNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
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
}
