//
//  surah_item.dart
//  Created on 2023 10 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serat/serat_router.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/l10n/app_local.dart';
import 'package:serat/widgets/surah_number.dart';

class SurahItem extends StatelessWidget {
  final AppRepository appRepository;
  final int index;
  final String title;
  final String englishTitle;
  final String type;
  final int versesCount;
  final List<int>? verses;
  final bool disableSideBtn;

  const SurahItem(
      {super.key,
      required this.appRepository,
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
      onTap: () => context.router.push(VersesReadingRoute(
          surahNumber: index,
          surahName: title,
          surahEnglishName: englishTitle,
          surahType: type,
          versesCount: versesCount,
          verses: verses)),
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
                    size: 30,
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
