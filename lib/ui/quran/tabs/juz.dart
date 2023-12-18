//
//  juz.dart
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
import 'package:serat/widgets/number_btn.dart';

class Juz extends StatelessWidget {
  final AppRepository appRepository;
  const Juz({super.key, required this.appRepository});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            physics: const BouncingScrollPhysics(),
            itemCount: context.read<QuranCubit>().getTotalJuzCount,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () => context.router.push(QuranReadingRoute(
                      surahNumber: context
                          .read<QuranCubit>()
                          .starterSurahNumberByJuz(index + 1),
                      verseNumber: context
                          .read<QuranCubit>()
                          .starterVerseNumberByJuz(index + 1))),
                  child: NumberBtn(number: index + 1));
            });
      },
    );
  }
}
