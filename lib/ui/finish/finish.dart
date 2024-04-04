//
//  finish.dart
//  Created on 2023 31 October.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serat/controller/app/app_cubit.dart';
import 'package:serat/controller/finish/finish_cubit.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/ui/finish/finish_shimmer.dart';
import 'package:serat/widgets/serat_appbar.dart';
import 'package:serat/widgets/serat_drawer.dart';
import 'package:quran/quran.dart' as quran;
import 'package:serat/widgets/surah_starter.dart';

class Finish extends StatelessWidget {
  final AppRepository appRepository;
  const Finish({required this.appRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<FinishCubit>(
          create: (BuildContext context) =>
              FinishCubit(appRepository: appRepository))
    ], child: const FinishView());
  }
}

class FinishView extends StatelessWidget {
  const FinishView({super.key});

  @override
  Widget build(BuildContext context) {
    String langCode = context.read<AppCubit>().getSavedLanguage();

    context
        .read<FinishCubit>()
        .getPageData(pageNumber: context.read<FinishCubit>().getLastPageNumber);
    return BlocBuilder<FinishCubit, FinishState>(
        builder: (context, state) => state.status == FinishStatus.page
            ? Scaffold(
                backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
                appBar: SeratAppbar(
                  langCode: langCode,
                  title: "صفحه ${state.pageData?.pageNumber}",
                  subTitle: state.pageData?.surahs
                          .fold(
                              '',
                              (previousValue, element) =>
                                  '$previousValue ${element.surahName}')
                          .trim()
                          .replaceAll(' ', '، ') ??
                      '',
                  juzNumber: state.pageData?.pageJuzNumber ?? 0,
                  font: SeratFont.bZar,
                  fontSize: 20,
                ),
                drawer: SeratDrawer(),
                body: SafeArea(
                  child: ListView.builder(
                      controller: context.read<FinishCubit>().scrollController,
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 70, left: 20, right: 20),
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.pageData?.surahs.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // if verse number is 1, display surah name
                            state.pageData!.surahs[index].verses.first
                                        .verseNumber ==
                                    1
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 30),
                                    child: SurahStarter(
                                        size: MediaQuery.of(context).size,
                                        surahName: state
                                            .pageData!.surahs[index].surahName,
                                        surahNumber: state.pageData!
                                            .surahs[index].surahNumber))
                                : Container(),
                            RichText(
                                textAlign: TextAlign.justify,
                                textDirection: TextDirection.rtl,
                                text: TextSpan(
                                    children: state
                                        .pageData!.surahs[index].verses
                                        .map<InlineSpan>((verse) => TextSpan(
                                              style: TextStyle(
                                                  fontFamily:
                                                      SeratFont.amiriQuran.name,
                                                  fontSize: 26,
                                                  color: Colors.black,
                                                  height: 3),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        '${verse.arabicText}\t${quran.getVerseEndSymbol(verse.verseNumber)}\t'),
                                              ],
                                            ))
                                        .toList()))
                          ],
                        );
                      }),
                ),
                floatingActionButton: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                        backgroundColor: const Color(0xFF672CBC),
                        child: Image.asset('assets/icons/back_rtl.png',
                            color: Colors.white, width: 20),
                        onPressed: () {
                          //scroll up on page change
                          context.read<AppCubit>().scrollTo(
                              context.read<FinishCubit>().scrollController,
                              0.0,
                              Curves.fastOutSlowIn);

                          int previousPage =
                              context.read<FinishCubit>().getLastPageNumber - 1;

                          // first page controller
                          if (previousPage < 1) {
                            previousPage =
                                context.read<FinishCubit>().totalPagesCount;
                          }

                          context.read<FinishCubit>().setLastPage(previousPage);
                          context
                              .read<FinishCubit>()
                              .getPageData(pageNumber: previousPage);
                        }),
                    const SizedBox(width: 10),
                    FloatingActionButton.extended(
                        backgroundColor: const Color(0xFF672CBC),
                        onPressed: null,
                        label: Text(
                          "صفحه ${state.pageData!.pageNumber}",
                          style: const TextStyle(
                              fontFamily: 'BTitr',
                              fontSize: 16,
                              color: Colors.white),
                        )),
                    const SizedBox(width: 10),
                    FloatingActionButton(
                        backgroundColor: const Color(0xFF672CBC),
                        child: Image.asset('assets/icons/back_ltr.png',
                            color: Colors.white, width: 20),
                        onPressed: () {
                          //scroll up on page change
                          context.read<AppCubit>().scrollTo(
                              context.read<FinishCubit>().scrollController,
                              0.0,
                              Curves.fastOutSlowIn);

                          int nextPage =
                              context.read<FinishCubit>().getLastPageNumber + 1;

                          // last page controller
                          if (nextPage >
                              context.read<FinishCubit>().totalPagesCount) {
                            nextPage = 1;
                          }

                          context.read<FinishCubit>().setLastPage(nextPage);
                          context
                              .read<FinishCubit>()
                              .getPageData(pageNumber: nextPage);
                        }),
                  ],
                ))
            : const FinishShimmer());
  }
}
