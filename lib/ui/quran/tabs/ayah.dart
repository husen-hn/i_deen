//
//  ayah.dart
//  Created on 2023 02 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_deen/controller/quran/quran_cubit.dart';
import 'package:i_deen/widgets/surah_item.dart';

class Ayah extends StatelessWidget {
  const Ayah({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        itemCount: context.read<QuranCubit>().getTotalSurahCount,
        itemBuilder: (context, index) {
          return SurahItem(
            index: index + 1,
            title: context.read<QuranCubit>().getSurahNameArabic(index + 1),
            type: context
                    .read<QuranCubit>()
                    .getTotalMadaniSurahs
                    .contains(index + 1)
                ? 'مدنی'
                : context
                        .read<QuranCubit>()
                        .getTotalXORMadaniMacciSurahs
                        .contains(index + 1)
                    ? 'مکی / مدنی'
                    : 'مکی',
            versesCount: context.read<QuranCubit>().getVerseCount(index + 1),
            disableSideBtn: true,
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
  }
}
