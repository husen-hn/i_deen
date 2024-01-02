//
//  bookmark_reading.dart
//  Created on 2023 06 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serat/controller/ad/ad_cubit.dart';
import 'package:serat/controller/app/app_cubit.dart';
import 'package:serat/controller/bookmark/bookmark_cubit.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/l10n/app_local.dart';
import 'package:serat/widgets/page_reading.dart';
import 'package:serat/widgets/page_reading_shimmer.dart';
import 'package:serat/widgets/reading_appbar.dart';

@RoutePage(name: 'BookmarkReadingRoute')
class BookmarkReading extends StatelessWidget {
  final AppRepository appRepository;
  final int surahNumber;
  final int verseNumber;

  const BookmarkReading(
      {super.key,
      required this.appRepository,
      required this.surahNumber,
      required this.verseNumber});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BookmarkCubit>(
              create: (BuildContext context) =>
                  BookmarkCubit(appRepository: appRepository)),
          BlocProvider<AdCubit>(
              create: (BuildContext context) => AdCubit(
                  appRepository: context.read<AppCubit>().appRepository))
        ],
        child: BookmarkReadingView(
          surahNumber: surahNumber,
          verseNumber: verseNumber,
        ));
  }
}

class BookmarkReadingView extends StatelessWidget {
  final int surahNumber;
  final int verseNumber;

  const BookmarkReadingView(
      {super.key, required this.surahNumber, required this.verseNumber});

  @override
  Widget build(BuildContext context) {
    if (Random().nextInt(5) == 0) {
      context.read<AdCubit>().getRewardedAd();
    }

    context.read<BookmarkCubit>().getPageData(
        pageNumber:
            context.read<AppCubit>().getPageNumber(surahNumber, verseNumber),
        surahNumber: surahNumber,
        verseNumber: verseNumber);

    return BlocBuilder<BookmarkCubit, BookmarkState>(
        builder: (context, state) => state.status == BookmarkStatus.page
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
                    onTapSave: (surahNumber, verseNumber, isSaved) {
                      isSaved
                          ? context
                              .read<BookmarkCubit>()
                              .removeVerse(surahNumber, verseNumber)
                          : context
                              .read<BookmarkCubit>()
                              .saveVerse(surahNumber, verseNumber);

                      // get all saved verses again
                      context.read<BookmarkCubit>().getPageData(
                          pageNumber: context
                              .read<AppCubit>()
                              .getPageNumber(surahNumber, verseNumber),
                          surahNumber: surahNumber,
                          verseNumber: verseNumber);
                    },
                    onTapShare: (surahNumber, verseNumber, arabicText, trText) {
                      String surahName = context
                          .read<BookmarkCubit>()
                          .getSurahNameArabic(surahNumber);
                      context.read<AppCubit>().shareText(
                          "${'ayah'.tr(context)} $verseNumber ${'surah'.tr(context)} $surahName\n\n$arabicText\n$trText\n\n\n${'app_name'.tr(context)}\n${'app_introduce'.tr(context)}\n[${'dl_link'.tr(context)}](${'app_link'.tr(context)})");
                    },
                    onVerseVisible: (int surahNumber, int verseNumber) =>
                        context.read<AppCubit>().saveLastSeen(surahNumber,
                            verseNumber, const Duration(seconds: 4))),
                floatingActionButton: state.status == BookmarkStatus.page
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                              backgroundColor: const Color(0xFF672CBC),
                              child: Image.asset('assets/icons/back_rtl.png',
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
                                    .read<BookmarkCubit>()
                                    .getPageData(pageNumber: previousPage);
                              }),
                          const SizedBox(width: 10),
                          FloatingActionButton.extended(
                              backgroundColor: const Color(0xFF672CBC),
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
                              backgroundColor: const Color(0xFF672CBC),
                              child: Image.asset(
                                'assets/icons/back_ltr.png',
                                color: Colors.white,
                                width: 20,
                              ),
                              onPressed: () {
                                int nextPage = state.pageData!.pageNumber + 1;

                                // last page controller
                                if (nextPage >
                                    context.read<AppCubit>().totalPagesCount) {
                                  nextPage = 1;
                                }

                                context
                                    .read<BookmarkCubit>()
                                    .getPageData(pageNumber: nextPage);
                              }),
                        ],
                      )
                    : Container())
            : const PageReadingShimmer());
  }
}
