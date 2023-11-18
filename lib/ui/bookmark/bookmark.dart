//
//  bookmark.dart
//  Created on 2023 31 October.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_deen/controller/app/app_cubit.dart';
import 'package:i_deen/controller/bookmark/bookmark_cubit.dart';
import 'package:i_deen/services/helper/l10n/app_local.dart';
import 'package:i_deen/widgets/ayah_item.dart';
import 'package:i_deen/widgets/i_deen_appbar.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<BookmarkCubit>(
          create: ((BuildContext context) => BookmarkCubit()))
    ], child: const BookmarkView());
  }
}

class BookmarkView extends StatelessWidget {
  const BookmarkView({super.key});

  @override
  Widget build(BuildContext context) {
    String langCode = context.read<AppCubit>().getSavedLanguage();
    context.read<BookmarkCubit>().getAllSavedVerses();

    return Scaffold(
      appBar: IDeenAppbar(langCode: langCode),
      body:
          BlocBuilder<BookmarkCubit, BookmarkState>(builder: (context, state) {
        if (state.status == BookmarkStatus.verses) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .5,
                height: MediaQuery.of(context).size.height * .1,
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
                          Image.asset('assets/icons/ayah.png',
                              color: Colors.white),
                          Text(
                            'saveds'.tr(context),
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Amiri',
                                fontWeight: FontWeight.w800,
                                fontSize: 30),
                          ),
                          Image.asset('assets/icons/ayah.png',
                              color: Colors.white)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.verses!.length,
                  itemBuilder: (context, index) {
                    return AyahItem(
                      surahName: state.verses![index]['surahArabicName'],
                      surahNumber: state.verses![index]['surahNumber'],
                      // display index for verses number on full surah, and display verses number on limited surah
                      ayahNumber: state.verses![index]['verseNumber'],
                      arabicText: state.verses![index]['verse'],
                      translation: 'translation',
                      isSaved: true,
                      onSaveTap: () {
                        context.read<BookmarkCubit>().removeVerse(
                            state.verses![index]['surahNumber'],
                            state.verses![index]['verseNumber']);

                        // get all saved verses again
                        context.read<BookmarkCubit>().getAllSavedVerses();
                      },
                    );
                  }),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
