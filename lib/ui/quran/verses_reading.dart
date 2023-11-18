//
//  verses_reading.dart
//  Created on 2023 05 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:i_deen/controller/quran/quran_cubit.dart';
import 'package:i_deen/services/helper/l10n/app_local.dart';
import 'package:i_deen/widgets/ayah_item.dart';

class VersesReading extends StatelessWidget {
  final int surahNumber;
  final String surahName;
  final String surahEnglishName;
  final String surahType;
  final int versesCount;
  final List<int>? verses;

  const VersesReading({
    super.key,
    required this.surahNumber,
    required this.surahName,
    required this.surahEnglishName,
    required this.surahType,
    required this.versesCount,
    required this.verses,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<QuranCubit>(
              create: (BuildContext context) => QuranCubit())
        ],
        child: VersesReadingView(
            surahNumber: surahNumber,
            surahName: surahName,
            surahEnglishName: surahEnglishName,
            surahType: surahType,
            versesCount: versesCount,
            verses: verses));
  }
}

class VersesReadingView extends StatelessWidget {
  final int surahNumber;
  final String surahName;
  final String surahEnglishName;
  final String surahType;
  final int versesCount;
  final List<int>? verses;

  const VersesReadingView({
    super.key,
    required this.surahNumber,
    required this.surahName,
    required this.surahEnglishName,
    required this.surahType,
    required this.versesCount,
    required this.verses,
  });

  @override
  Widget build(BuildContext context) {
    context.read<QuranCubit>().getVerses(surahNumber, verseNumber: verses);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            surahName,
            style: const TextStyle(
                fontFamily: 'Amiri', fontWeight: FontWeight.w900, fontSize: 20),
          ),
          shadowColor: Colors.transparent,
          leading: GestureDetector(
            child: Image.asset('assets/icons/back_rtl.png'),
            onTap: () => context.pop(),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .5,
              height: MediaQuery.of(context).size.height * .4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                gradient: const LinearGradient(
                    colors: [Color(0xFF9055FF), Color(0xFFDF98FA)]),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xFF9055FF).withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 20))
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: -30,
                    bottom: -50,
                    child: Image.asset(
                      'assets/namaz_logo.png',
                      opacity: const AlwaysStoppedAnimation(.2),
                      width: MediaQuery.of(context).size.width * .7,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        surahName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Amiri',
                            fontWeight: FontWeight.w800,
                            fontSize: 30),
                      ),
                      Text(
                        surahEnglishName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Amiri',
                            fontWeight: FontWeight.w800,
                            fontSize: 24),
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            surahType,
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'BZar',
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .02),
                          Text(
                            "$versesCount ${'ayah'.tr(context)}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'BZar',
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .07,
                      ),
                      // to not display besmelah in tobe surah
                      surahNumber == 9
                          ? Container()
                          : Image.asset(
                              'assets/besmelah.png',
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width * .6,
                            ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<QuranCubit, QuranState>(builder: (context, state) {
              if (state.status == QuranStatus.verses) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.verses!['verses'].length,
                    itemBuilder: (context, index) {
                      return AyahItem(
                        surahNumber: surahNumber,
                        // display index for verses number on full surah, and display verses number on limited surah
                        ayahNumber: verses == null ? index + 1 : verses![index],
                        arabicText: state.verses!['verses'][index],
                        translation: 'translation',
                        isSaved: state.verses!["saved"].contains(
                            '$surahNumber-${verses == null ? index + 1 : verses![index]}'),
                        onSaveTap: () {
                          if (state.verses!["saved"].contains(
                              '$surahNumber-${verses == null ? index + 1 : verses![index]}')) {
                            context.read<QuranCubit>().removeVerse(surahNumber,
                                verses == null ? index + 1 : verses![index]);
                          } else {
                            context.read<QuranCubit>().saveVerse(surahNumber,
                                verses == null ? index + 1 : verses![index]);
                          }

                          // get all saved verses again

                          context.read<QuranCubit>().getVerses(surahNumber);
                        },
                      );
                    });
              } else {
                return Container();
              }
            })
          ],
        ));
  }
}
