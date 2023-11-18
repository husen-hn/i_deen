//
//  page_reading.dart
//  Created on 2023 11 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:i_deen/controller/quran/quran_cubit.dart';
import 'package:i_deen/widgets/ayah_item.dart';

class PageReading extends StatelessWidget {
  final int surahNumber;
  final int surahVerseNumber;

  const PageReading(
      {super.key, required this.surahNumber, required this.surahVerseNumber});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<QuranCubit>(
              create: (BuildContext context) => QuranCubit())
        ],
        child: PageReadingView(
            surahNumber: surahNumber, surahVerseNumber: surahVerseNumber));
  }
}

class PageReadingView extends StatelessWidget {
  final int surahNumber;
  final int surahVerseNumber;

  const PageReadingView(
      {super.key, required this.surahNumber, required this.surahVerseNumber});

  @override
  Widget build(BuildContext context) {
    int pageNumber =
        context.read<QuranCubit>().getSurahPages(surahNumber)[surahVerseNumber];
    context.read<QuranCubit>().getPageVerses(pageNumber);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'صفحه $pageNumber',
            style: const TextStyle(
                fontFamily: 'BZar', fontWeight: FontWeight.w900, fontSize: 20),
          ),
          shadowColor: Colors.transparent,
          leading: GestureDetector(
            child: Image.asset('assets/icons/back_rtl.png'),
            onTap: () => context.pop(),
          ),
        ),
        body: BlocBuilder<QuranCubit, QuranState>(builder: (context, state) {
          if (state.status == QuranStatus.page) {
            return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                physics: const BouncingScrollPhysics(),
                itemCount: state.pageData!['data'].length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // if verse number is 1, display surah name
                      state.pageData!['data'][index]['verses'].first.keys
                                  .first ==
                              1
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 30),
                              child: _surahName(
                                  context,
                                  state.pageData!['data'][index]
                                      ['surahArabicName'],
                                  surahNumber),
                            )
                          : Container(),

                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              state.pageData!['data'][index]['verses'].length,
                          itemBuilder: (context, nestedIndex) {
                            return AyahItem(
                              surahNumber: surahNumber,
                              // display index for verses number on full surah, and display verses number on limited surah
                              ayahNumber: state
                                  .pageData!['data'][index]['verses']
                                      [nestedIndex]
                                  .keys
                                  .first,
                              arabicText: state.pageData!['data'][index]
                                      ['verses'][nestedIndex][
                                  state
                                      .pageData!['data'][index]['verses']
                                          [nestedIndex]
                                      .keys
                                      .first],
                              translation: 'translation',
                              isSaved: state.pageData!["saved"].contains(
                                  '$surahNumber-${state.pageData!['data'][index]['verses'][nestedIndex].keys.first}'),
                              onSaveTap: () {
                                if (state.pageData!["saved"].contains(
                                    '$surahNumber-${state.pageData!['data'][index]['verses'][nestedIndex].keys.first}')) {
                                  context.read<QuranCubit>().removeVerse(
                                        surahNumber,
                                        state
                                            .pageData!['data'][index]['verses']
                                                [nestedIndex]
                                            .keys
                                            .first,
                                      );
                                } else {
                                  context.read<QuranCubit>().saveVerse(
                                        surahNumber,
                                        state
                                            .pageData!['data'][index]['verses']
                                                [nestedIndex]
                                            .keys
                                            .first,
                                      );
                                }

                                // get all saved verses again
                                context
                                    .read<QuranCubit>()
                                    .getPageVerses(surahNumber);
                              },
                            );
                          })
                    ],
                  );
                });
          } else {
            return Container();
          }
        }));
  }

  _surahName(BuildContext context, String surahName, int surahNumber) =>
      Container(
        width: MediaQuery.of(context).size.width * .5,
        height: surahNumber == 9
            ? MediaQuery.of(context).size.height * .1
            : MediaQuery.of(context).size.height * .2,
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/icons/ayah.png', color: Colors.white),
                  Text(
                    surahName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Amiri',
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                  ),
                  Image.asset('assets/icons/ayah.png', color: Colors.white)
                ],
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
        ),
      );
}