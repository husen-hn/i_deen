//
//  surah.dart
//  Created on 2023 02 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_deen/controller/quran/quran_cubit.dart';
import 'package:i_deen/widgets/surah_item.dart';

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
              return SurahItem(
                appRepository: context.read<QuranCubit>().appRepository,
                index: index + 1,
                title: context.read<QuranCubit>().getSurahNameArabic(index + 1),
                englishTitle:
                    context.read<QuranCubit>().getSurahNameEnglish(index + 1),
                type: context
                        .read<QuranCubit>()
                        .getPlaceOfRevelation(index + 1)
                        .contains('Makkah')
                    ? 'مکی'
                    : 'مدنی',
                versesCount:
                    context.read<QuranCubit>().getVerseCount(index + 1),
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
