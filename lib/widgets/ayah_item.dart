//
//  ayah_item.dart
//  Created on 2023 06 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';

class AyahItem extends StatelessWidget {
  final String surahName;
  final int ayahNumber;
  final String arabicText;
  final String translation;

  const AyahItem(
      {super.key,
      required this.surahName,
      required this.ayahNumber,
      required this.arabicText,
      required this.translation});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xFF863ED5),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/icons/share.png'),
                        Image.asset('assets/icons/play.png'),
                        Image.asset('assets/icons/save.png'),
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
            style: const TextStyle(
              color: Color(0xFF240F4F),
              fontFamily: 'Amiri',
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          Text(translation,
              style: const TextStyle(
                color: Color(0xFF240F4F),
                fontFamily: 'BZar',
                fontWeight: FontWeight.w400,
                fontSize: 18,
              )),
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          const Divider(
            height: 5,
            color: Color.fromRGBO(187, 196, 206, 0.35),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .02),
        ],
      ),
    );
  }
}
