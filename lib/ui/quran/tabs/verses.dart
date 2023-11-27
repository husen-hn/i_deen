//
//  verses.dart
//  Created on 2023 02 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:i_deen/controller/quran/quran_cubit.dart';
import 'package:i_deen/services/app/app_repository.dart';
import 'package:i_deen/services/helper/l10n/app_local.dart';
import 'package:i_deen/widgets/number_btn.dart';

class Verses extends StatelessWidget {
  final AppRepository appRepository;
  const Verses({super.key, required this.appRepository});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            itemCount: context.read<QuranCubit>().getTotalSurahCount,
            itemBuilder: (context, index) {
              return ExpansionTile(
                collapsedIconColor: const Color(0xFF994EF8),
                iconColor: const Color(0xFF994EF8),
                subtitle: Row(
                  children: [
                    Text(
                        context
                                .read<QuranCubit>()
                                .getPlaceOfRevelation(index + 1)
                                .contains('Makkah')
                            ? 'مکی'
                            : 'مدنی',
                        style: const TextStyle(
                            fontFamily: 'BZar',
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                        "${context.read<QuranCubit>().getVerseCount(index + 1)} ${'ayah'.tr(context)}",
                        style: const TextStyle(
                            fontFamily: 'BZar',
                            fontSize: 16,
                            fontWeight: FontWeight.w500))
                  ],
                ),
                collapsedTextColor: const Color(0xFF8789A3),
                textColor: const Color(0xFF994EF8),
                title: Text(
                  context.read<QuranCubit>().getSurahNameArabic(index + 1),
                  style: const TextStyle(
                      color: Color(0xFF240F4F),
                      fontFamily: 'Amiri',
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          context.read<QuranCubit>().getVerseCount(index + 1),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, nestedIndex) {
                        return InkWell(
                            onTap: () => context.pushNamed(
                                  'verses-reading',
                                  pathParameters: {
                                    'surahNumber': (index + 1).toString(),
                                    'surahName': context
                                        .read<QuranCubit>()
                                        .getSurahNameArabic(index + 1),
                                    'surahEnglishName': context
                                        .read<QuranCubit>()
                                        .getSurahNameEnglish(index + 1),
                                    'surahType': context
                                            .read<QuranCubit>()
                                            .getPlaceOfRevelation(index + 1)
                                            .contains('Makkah')
                                        ? 'مکی'
                                        : 'مدنی',
                                    'versesCount': context
                                        .read<QuranCubit>()
                                        .getVerseCount(index + 1)
                                        .toString(),
                                    'verses': [nestedIndex + 1].toString()
                                  },
                                ),
                            child: NumberBtn(number: nestedIndex + 1));
                      })
                ],
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: const Color(0xff8789A3).withOpacity(0.1),
                        width: 1.0),
                  ),
                ),
              );
            });
      },
    );
  }
}
