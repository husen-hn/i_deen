//
//  page.dart
//  Created on 2023 02 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:i_deen/controller/quran/quran_cubit.dart';
import 'package:i_deen/widgets/number_btn.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            physics: const BouncingScrollPhysics(),
            itemCount: context.read<QuranCubit>().getTotalSurahCount,
            itemBuilder: (context, index) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.read<QuranCubit>().getSurahNameArabic(index + 1),
                      style: const TextStyle(
                          color: Color(0xFF240F4F),
                          fontFamily: 'Amiri',
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                    GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: context
                            .read<QuranCubit>()
                            .getSurahPages(index + 1)
                            .length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, nestedIndex) {
                          return InkWell(
                            onTap: () => context
                                .pushNamed('page-reading', pathParameters: {
                              'surahNumber': (index + 1).toString(),
                              'surahVerseNumber': nestedIndex.toString()
                            }),
                            child: NumberBtn(
                                number: context
                                    .read<QuranCubit>()
                                    .getSurahPages(index + 1)[nestedIndex]),
                          );
                        })
                  ]);
            });
      },
    );
  }
}
