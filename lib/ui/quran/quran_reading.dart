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
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/services/helper/serat_icon.dart';
import 'package:serat/widgets/page_reading.dart';
import 'package:serat/widgets/page_reading_shimmer.dart';

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
        verseNumber: verseNumber,
        size: MediaQuery.of(context).size);

    return BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) => state.status == QuranStatus.page
            ? Scaffold(
                appBar: AppBar(
                  title: Text(
                    "${'page'.tr(context)} ${state.pageData?.pageNumber}",
                    style: TextStyle(
                        fontFamily: SeratFont.bZar.name,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                  shadowColor: Colors.transparent,
                  leading: GestureDetector(
                      child: Image.asset(SeratIcon.backRTL.name),
                      onTap: () {
                        context.router.pop();
                      }),
                ),
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
                          verseNumber: verseNumber,
                          size: MediaQuery.of(context).size);
                    }),
                    onVerseVisible: (int surahNumber, int verseNumber) =>
                        context.read<AppCubit>().saveLastSeen(surahNumber,
                            verseNumber, const Duration(seconds: 4))),
                floatingActionButton: state.status == QuranStatus.page
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                              backgroundColor: const Color(0xFF672CBC),
                              child: Image.asset('assets/icons/back_rtl.png',
                                  color: Colors.white),
                              onPressed: () {
                                int previousPage =
                                    state.pageData!.pageNumber - 1;

                                // // first page controller
                                if (previousPage < 1) {
                                  previousPage =
                                      context.read<AppCubit>().totalPagesCount;
                                }

                                context.read<QuranCubit>().getPageData(
                                    pageNumber: previousPage,
                                    size: MediaQuery.of(context).size);
                              }),
                          const SizedBox(width: 10),
                          FloatingActionButton.extended(
                              backgroundColor: const Color(0xFF672CBC),
                              onPressed: null,
                              label: Text(
                                "${'page'.tr(context)} ${state.pageData?.pageNumber}",
                                style: const TextStyle(
                                    fontFamily: 'BTitr', fontSize: 16),
                              )),
                          const SizedBox(width: 10),
                          FloatingActionButton(
                              backgroundColor: const Color(0xFF672CBC),
                              child: Image.asset('assets/icons/back_ltr.png',
                                  color: Colors.white),
                              onPressed: () {
                                int nextPage = state.pageData!.pageNumber + 1;

                                // last page controller
                                if (nextPage >
                                    context.read<AppCubit>().totalPagesCount) {
                                  nextPage = 1;
                                }

                                context.read<QuranCubit>().getPageData(
                                    pageNumber: nextPage,
                                    size: MediaQuery.of(context).size);
                              }),
                        ],
                      )
                    : Container())
            : const PageReadingShimmer());
  }
}
