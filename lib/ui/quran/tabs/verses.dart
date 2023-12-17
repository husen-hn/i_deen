//
//  verses.dart
//  Created on 2023 02 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serat/controller/quran/quran_cubit.dart';
import 'package:serat/serat_router.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/l10n/app_local.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/widgets/number_btn.dart';

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
                        style: TextStyle(
                            fontFamily: SeratFont.bZar.name,
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
                  style: TextStyle(
                      color: const Color(0xFF240F4F),
                      fontFamily: SeratFont.amiri.name,
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
                            onTap: () => context.router.push(QuranReadingRoute(
                                surahNumber: index + 1,
                                verseNumber: nestedIndex + 1)),
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
