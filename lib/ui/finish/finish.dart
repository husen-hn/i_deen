//
//  finish.dart
//  Created on 2023 31 October.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_deen/controller/app/app_cubit.dart';
import 'package:i_deen/controller/finish/finish_cubit.dart';
import 'package:i_deen/widgets/i_deen_appbar.dart';
import 'package:i_deen/widgets/serat_drawer.dart';
import 'package:quran/quran.dart' as quran;

class Finish extends StatelessWidget {
  const Finish({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<FinishCubit>(create: (BuildContext context) => FinishCubit())
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
        .getPageData(context.read<FinishCubit>().getLastPageNumber);
    return Scaffold(
      appBar: IDeenAppbar(langCode: langCode),
      drawer: SeratDrawer(),
      body: BlocBuilder<FinishCubit, FinishState>(builder: (context, state) {
        return state.status == FinishStatus.page
            ? SafeArea(
                child: ListView.builder(
                    controller: context.read<FinishCubit>().scrollController,
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 70, left: 20, right: 20),
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
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 30),
                                  child: _surahName(
                                    context,
                                    state.pageData!['data'][index]
                                        ['surahArabicName'],
                                    state.pageData!['data'][index]
                                        ['surahNumber'],
                                  ),
                                )
                              : Container(),
                          RichText(
                              textAlign: TextAlign.justify,
                              textDirection: TextDirection.rtl,
                              text: TextSpan(
                                  children: state.pageData!['data'][index]
                                          ['verses']
                                      .map<InlineSpan>((verse) => TextSpan(
                                            style: const TextStyle(
                                                fontFamily: 'AmiriQuran',
                                                fontSize: 26,
                                                color: Colors.black,
                                                height: 3),
                                            children: [
                                              TextSpan(
                                                  text: verse[
                                                          verse.keys.first] +
                                                      '\t${quran.getVerseEndSymbol(verse.keys.first)}\t'),
                                            ],
                                          ))
                                      .toList()))
                        ],
                      );
                    }),
              )
            : Container();
      }),
      floatingActionButton: BlocBuilder<FinishCubit, FinishState>(
        builder: (context, state) {
          return state.status == FinishStatus.page
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                        backgroundColor: const Color(0xFF672CBC),
                        child: Image.asset('assets/icons/back_rtl.png',
                            color: Colors.white),
                        onPressed: () {
                          //scroll up on page change
                          _animateToIndex(0, context);

                          int previousPage =
                              context.read<FinishCubit>().getLastPageNumber - 1;

                          // first page controller
                          if (previousPage < 1) {
                            previousPage =
                                context.read<FinishCubit>().totalPagesCount;
                          }

                          context.read<FinishCubit>().setLastPage(previousPage);
                          context.read<FinishCubit>().getPageData(previousPage);
                        }),
                    const SizedBox(width: 10),
                    FloatingActionButton.extended(
                        backgroundColor: const Color(0xFF672CBC),
                        onPressed: null,
                        label: Text(
                          "صفحه ${state.pageData!['page']}",
                          style: const TextStyle(
                              fontFamily: 'BTitr', fontSize: 16),
                        )),
                    const SizedBox(width: 10),
                    FloatingActionButton(
                        backgroundColor: const Color(0xFF672CBC),
                        child: Image.asset('assets/icons/back_ltr.png',
                            color: Colors.white),
                        onPressed: () {
                          //scroll up on page change
                          _animateToIndex(0, context);

                          int nextPage =
                              context.read<FinishCubit>().getLastPageNumber + 1;

                          // last page controller
                          if (nextPage >
                              context.read<FinishCubit>().totalPagesCount) {
                            nextPage = 1;
                          }

                          context.read<FinishCubit>().setLastPage(nextPage);
                          context.read<FinishCubit>().getPageData(nextPage);
                        }),
                  ],
                )
              : Container();
        },
      ),
    );
  }

  Widget _surahName(BuildContext context, String surahName, int surahNumber) =>
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

  void _animateToIndex(double index, BuildContext context) {
    context.read<FinishCubit>().scrollController.animateTo(
          index,
          duration: const Duration(milliseconds: 1),
          curve: Curves.fastOutSlowIn,
        );
  }
}
