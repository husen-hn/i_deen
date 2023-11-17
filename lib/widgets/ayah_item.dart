//
//  ayah_item.dart
//  Created on 2023 06 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_deen/controller/quran/quran_cubit.dart';

class AyahItem extends StatelessWidget {
  final String surahName;
  final int surahNumber;
  final int ayahNumber;
  final String arabicText;
  final String translation;
  final bool isSaved;

  const AyahItem({
    super.key,
    required this.surahName,
    required this.surahNumber,
    required this.ayahNumber,
    required this.arabicText,
    required this.translation,
    required this.isSaved,
  });

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
                        // Image.asset('assets/icons/share.png'),
                        // Image.asset('assets/icons/play.png'),
                        InkWell(
                            onTap: () {
                              if (isSaved) {
                                context
                                    .read<QuranCubit>()
                                    .removeVerse(surahNumber, ayahNumber);
                              } else {
                                context
                                    .read<QuranCubit>()
                                    .saveVerse(surahNumber, ayahNumber);
                              }

                              // // get all saved verses again
                              context.read<QuranCubit>().getVerses(surahNumber);
                            },
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
            style: const TextStyle(
              color: Color(0xFF240F4F),
              fontFamily: 'QuranTaha',
              fontWeight: FontWeight.w700,
              fontSize: 20,
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
