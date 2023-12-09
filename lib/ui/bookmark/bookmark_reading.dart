//
//  bookmark_reading.dart
//  Created on 2023 06 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serat/controller/bookmark/bookmark_cubit.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/l10n/app_local.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/services/helper/serat_icon.dart';
import 'package:serat/widgets/reading.dart';

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
                  BookmarkCubit(appRepository: appRepository))
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
    context.read<BookmarkCubit>().getSavedPageData(surahNumber, verseNumber);

    return BlocBuilder<BookmarkCubit, BookmarkState>(
        builder: (context, state) => state.status == BookmarkStatus.page
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
                    onTap: () => context.router.pop(),
                  ),
                ),
                // surah's listview
                body: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.pageData?.surahs.length,
                    itemBuilder: (context, index) {
                      // Reading is a listview of surah's verses
                      return Reading(
                          surahNumber:
                              state.pageData!.surahs[index].surahNumber,
                          surahName: state.pageData!.surahs[index].surahName,
                          verses: state.pageData!.surahs[index].verses,
                          onTapSave: (int surahNumber, int verseNumber) {});
                    }))
            : Container());
  }
}
