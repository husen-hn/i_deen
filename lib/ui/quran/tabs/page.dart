//
//  page.dart
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

class Page extends StatelessWidget {
  final AppRepository appRepository;
  const Page({super.key, required this.appRepository});

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
                            onTap: () => context.router.push(PageReadingRoute(
                                surahNumber: index + 1,
                                surahVerseNumber: nestedIndex)),
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
