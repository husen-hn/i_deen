//
//  page.dart
//  Created on 2023 02 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serat/controller/quran/quran_cubit.dart';
import 'package:serat/serat_router.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/ad_type.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/ui/ad/ad.dart';
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
                    // displat Ads on every 10 item and use random to display dynamic ads and not display on initial of list
                    index % 3 == 0 && index != 0 && Random().nextInt(2) != 0
                        ? Ad(
                            appRepository: appRepository,
                            adType: AdType.nativeAd)
                        : Container(),
                    Text(
                      context.read<QuranCubit>().getSurahNameArabic(index + 1),
                      style: TextStyle(
                          color: const Color(0xFF240F4F),
                          fontFamily: SeratFont.amiri.name,
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
                            onTap: () => context.router.push(QuranReadingRoute(
                                pageNumber: context
                                    .read<QuranCubit>()
                                    .getSurahPages(index + 1)[nestedIndex])),
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
