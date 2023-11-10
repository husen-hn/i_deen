//
//  reading.dart
//  Created on 2023 10 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_deen/services/l10n/app_local.dart';
import 'package:i_deen/widgets/surah_number.dart';

class SurahItem extends StatelessWidget {
  final int index;
  final String title;
  final String englishTitle;
  final String type;
  final int versesCount;
  final List<int>? verses;
  final bool disableSideBtn;

  const SurahItem(
      {super.key,
      required this.index,
      required this.title,
      required this.englishTitle,
      required this.type,
      required this.versesCount,
      this.verses,
      this.disableSideBtn = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(
        'reading',
        pathParameters: {
          'surahNumber': (index).toString(),
          'surahName': title,
          'surahEnglishName': englishTitle,
          'surahType': type,
          'versesCount': versesCount.toString(),
          'verses': verses.toString()
        },
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SurahNumber(
                    number: index,
                    iconColor: const Color(0xFF994EF8),
                    textColor: const Color(0xFF240F4F),
                    size: 60,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Color(0xFF240F4F),
                          fontFamily: 'Amiri',
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(type,
                            style: const TextStyle(
                                color: Color(0xFF8789A3),
                                fontFamily: 'BZar',
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('$versesCount ${'ayah'.tr(context)}',
                            style: const TextStyle(
                                color: Color(0xFF8789A3),
                                fontFamily: 'BZar',
                                fontSize: 16,
                                fontWeight: FontWeight.w500))
                      ],
                    )
                  ],
                ),
              ],
            ),
            disableSideBtn
                ? Container()
                : IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_right,
                      color: Color(0xFF994EF8),
                    ))
          ],
        ),
      ),
    );
  }
}
