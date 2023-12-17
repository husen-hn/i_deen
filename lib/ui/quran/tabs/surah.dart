//
//  surah.dart
//  Created on 2023 02 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serat/controller/quran/quran_cubit.dart';
import 'package:serat/serat_router.dart';
import 'package:serat/widgets/surah_item.dart';

class Surah extends StatelessWidget {
  const Surah({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            itemCount: context.read<QuranCubit>().getTotalSurahCount,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => context.router.push(
                    QuranReadingRoute(surahNumber: index + 1, verseNumber: 1)),
                child: SurahItem(
                  index: index + 1,
                  title:
                      context.read<QuranCubit>().getSurahNameArabic(index + 1),
                  type: context
                          .read<QuranCubit>()
                          .getPlaceOfRevelation(index + 1)
                          .contains('Makkah')
                      ? 'مکی'
                      : 'مدنی',
                  versesCount:
                      context.read<QuranCubit>().getVerseCount(index + 1),
                ),
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
