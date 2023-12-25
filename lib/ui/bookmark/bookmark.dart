//
//  bookmark.dart
//  Created on 2023 31 October.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serat/controller/app/app_cubit.dart';
import 'package:serat/controller/bookmark/bookmark_cubit.dart';
import 'package:serat/serat_router.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/l10n/app_local.dart';
import 'package:serat/ui/bookmark/bookmark_shimmer.dart';
import 'package:serat/widgets/serat_appbar.dart';
import 'package:serat/widgets/serat_drawer.dart';
import 'package:serat/widgets/verse_item_expansion.dart';

class Bookmark extends StatelessWidget {
  final AppRepository appRepository;
  const Bookmark({required this.appRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BookmarkCubit>(
              create: ((BuildContext context) =>
                  BookmarkCubit(appRepository: appRepository)))
        ],
        child: BookmarkView(
          appRepository: appRepository,
        ));
  }
}

class BookmarkView extends StatelessWidget {
  final AppRepository appRepository;
  const BookmarkView({required this.appRepository, super.key});

  @override
  Widget build(BuildContext context) {
    String langCode = context.read<AppCubit>().getSavedLanguage();
    context.read<BookmarkCubit>().getAllSavedVerses();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: SeratAppbar(langCode: langCode, title: 'saveds'.tr(context)),
      drawer: SeratDrawer(),
      body:
          BlocBuilder<BookmarkCubit, BookmarkState>(builder: (context, state) {
        if (state.status == BookmarkStatus.verses) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            physics: const BouncingScrollPhysics(),
            children: [
              state.verses!.isEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .2,
                        ),
                        Text(
                          'empty'.tr(context),
                          style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'BTitr',
                              color: Colors.grey[600]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: const TextStyle(
                                    fontFamily: 'BZar',
                                    fontSize: 20,
                                    color: Colors.grey),
                                children: [
                                  TextSpan(text: 'for_save'.tr(context)),
                                  WidgetSpan(
                                      child: Image.asset(
                                          'assets/icons/bookmark_icon.png')),
                                  TextSpan(text: 'for_tuch'.tr(context)),
                                ]))
                      ],
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      reverse: true,
                      itemCount: state.verses!.length,
                      itemBuilder: (context, index) {
                        return VerseItemExpansion(
                          surahName: state.verses![index].surahArabicName,
                          surahNumber: state.verses![index].surahNumber,
                          // display index for verses number on full surah, and display verses number on limited surah
                          ayahNumber: state.verses![index].verseNumber,
                          arabicText: state.verses![index].verseArabicText,
                          translation: state.verses![index].translation,
                          isSaved: true,
                          onSaveTap: () {
                            context.read<BookmarkCubit>().removeVerse(
                                state.verses![index].surahNumber,
                                state.verses![index].verseNumber);
                            // get all saved verses again
                            context.read<BookmarkCubit>().getAllSavedVerses();
                          },
                          onVerseTap: () {
                            context.router.push(BookmarkReadingRoute(
                              appRepository: appRepository,
                              surahNumber: state.verses![index].surahNumber,
                              verseNumber: state.verses![index].verseNumber,
                            ));
                          },
                        );
                      }),
            ],
          );
        } else {
          return const Center(child: BookmarkShimmer());
        }
      }),
    );
  }
}
