//
//  page_reading.dart
//  Created on 2023 11 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serat/controller/app/app_cubit.dart';
import 'package:serat/controller/quran/quran_cubit.dart';
import 'package:serat/services/helper/l10n/app_local.dart';
import 'package:serat/services/helper/serat_icon.dart';
import 'package:serat/widgets/page_reading.dart';
import 'package:serat/widgets/page_reading_shimmer.dart';
import 'package:serat/widgets/reading_appbar.dart';

@RoutePage(name: 'QuranReadingRoute')
class QuranReading extends StatelessWidget {
  final int? pageNumber;
  final int? surahNumber;
  final int? verseNumber;

  const QuranReading(
      {super.key, this.pageNumber, this.surahNumber, this.verseNumber});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<QuranCubit>(
              create: (BuildContext context) => QuranCubit(
                  appRepository: context.read<AppCubit>().appRepository))
        ],
        child: QuranReadingView(
            pageNumber: pageNumber,
            surahNumber: surahNumber,
            verseNumber: verseNumber));
  }
}

class QuranReadingView extends StatelessWidget {
  final int? pageNumber;
  final int? surahNumber;
  final int? verseNumber;

  const QuranReadingView(
      {super.key, this.pageNumber, this.surahNumber, this.verseNumber});

  @override
  Widget build(BuildContext context) {
    context.read<QuranCubit>().getPageData(
        pageNumber: pageNumber ??
            context.read<AppCubit>().getPageNumber(
                surahNumber! < 1 ? 1 : surahNumber!,
                verseNumber! < 1 ? 1 : verseNumber!),
        surahNumber: surahNumber,
        verseNumber: verseNumber);

    return BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) => state.status == QuranStatus.page
            ? Scaffold(
                backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
                appBar: ReadingAppbar(
                    surahName: state.pageData?.surahs
                            .fold(
                                '',
                                (previousValue, element) =>
                                    '$previousValue ${element.surahName}')
                            .trim()
                            .replaceAll(' ', '، ') ??
                        '',
                    pageNumber: state.pageData?.pageNumber ?? 0,
                    juzNumber: state.pageData?.pageJuzNumber ?? 0),
                // surah's listview
                body: PageReading(
                    pageData: state.pageData!,
                    onTapSave: ((surahNumber, verseNumber, isSaved) {
                      isSaved
                          ? context
                              .read<QuranCubit>()
                              .removeVerse(surahNumber, verseNumber)
                          : context
                              .read<QuranCubit>()
                              .saveVerse(surahNumber, verseNumber);

                      // get all saved verses again
                      context.read<QuranCubit>().getPageData(
                          pageNumber: context
                              .read<AppCubit>()
                              .getPageNumber(surahNumber, verseNumber),
                          surahNumber: surahNumber,
                          verseNumber: verseNumber);
                    }),
                    onTapShare: (surahNumber, verseNumber, arabicText, trText) {
                      String surahName = context
                          .read<QuranCubit>()
                          .getSurahNameArabic(surahNumber);
                      context.read<AppCubit>().shareText(
                          "${'ayah'.tr(context)} $verseNumber ${'surah'.tr(context)} $surahName\n\n$arabicText\n$trText\n\n\n${'app_name'.tr(context)}\n${'app_introduce'.tr(context)}\n[${'dl_link'.tr(context)}](${'app_link'.tr(context)})");
                    },
                    onVerseVisible: (int surahNumber, int verseNumber) =>
                        context.read<AppCubit>().saveLastSeen(surahNumber,
                            verseNumber, const Duration(seconds: 4))),
                floatingActionButton: state.status == QuranStatus.page
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                              backgroundColor: const Color(0xFF672CBC),
                              child: Image.asset(SeratIcon.backRTL.name,
                                  color: Colors.white, width: 20),
                              onPressed: () {
                                int previousPage =
                                    state.pageData!.pageNumber - 1;

                                // // first page controller
                                if (previousPage < 1) {
                                  previousPage =
                                      context.read<AppCubit>().totalPagesCount;
                                }

                                context
                                    .read<QuranCubit>()
                                    .getPageData(pageNumber: previousPage);
                              }),
                          const SizedBox(width: 10),
                          FloatingActionButton.extended(
                              backgroundColor:
                                  const Color.fromRGBO(103, 44, 188, 1),
                              onPressed: null,
                              label: Text(
                                "${'page'.tr(context)} ${state.pageData?.pageNumber}",
                                style: const TextStyle(
                                    fontFamily: 'BTitr',
                                    fontSize: 16,
                                    color: Colors.white),
                              )),
                          const SizedBox(width: 10),
                          FloatingActionButton(
                              backgroundColor:
                                  const Color.fromRGBO(103, 44, 188, 1),
                              child: Image.asset(SeratIcon.back.name,
                                  color: Colors.white, width: 20),
                              onPressed: () {
                                int nextPage = state.pageData!.pageNumber + 1;

                                // last page controller
                                if (nextPage >
                                    context.read<AppCubit>().totalPagesCount) {
                                  nextPage = 1;
                                }

                                context
                                    .read<QuranCubit>()
                                    .getPageData(pageNumber: nextPage);
                              }),
                        ],
                      )
                    : Container())
            : const PageReadingShimmer());
  }
}
