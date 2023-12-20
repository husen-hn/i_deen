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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: size.height * .08,
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _icon(),
                      Text(
                        surahName,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: SeratFont.amiri.name,
                            fontWeight: FontWeight.w800,
                            fontSize: 30),
                      ),
                      _icon()
                    ]),
              ],
            ),
          ),
        ),
        // to not display besmelah in tobe surah
        surahNumber == 9
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(top: 30, left: 35, right: 35),
                child: Image.asset(SeratIcon.nameOfGod.name,
                    color: Colors.black, height: 50))
      ],
    );
  }

  Stack _icon() => Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            SeratIcon.verse.name,
            color: Colors.white,
            width: 10,
            height: 10,
          ),
          Image.asset(
            SeratIcon.verse.name,
            color: Colors.white,
            width: 20,
            height: 20,
          ),
          Image.asset(
            SeratIcon.verse.name,
            color: Colors.white,
            width: 30,
            height: 30,
          )
        ],
      );
}
