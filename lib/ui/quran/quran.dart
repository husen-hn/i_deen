//
//  quran.dart
//  Created on 2023 31 October.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serat/controller/app/app_cubit.dart';
import 'package:serat/controller/quran/quran_cubit.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/ui/quran/tabs/juz.dart';
import 'package:serat/ui/quran/tabs/page.dart' as pg;
import 'package:serat/ui/quran/tabs/surah.dart';
import 'package:serat/ui/quran/tabs/verses.dart';
import 'package:serat/widgets/i_deen_appbar.dart';
import 'package:serat/widgets/serat_drawer.dart';
import 'package:serat/widgets/tab_item.dart';
import 'package:serat/services/helper/l10n/app_local.dart';

class Quran extends StatelessWidget {
  final AppRepository appRepository;
  const Quran({required this.appRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<QuranCubit>(
          create: (BuildContext context) =>
              QuranCubit(appRepository: appRepository))
    ], child: const QuranView());
  }
}

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    String langCode = context.read<AppCubit>().getSavedLanguage();
    context.read<QuranCubit>().getLastSeen();

    return Scaffold(
      appBar: IDeenAppbar(langCode: langCode, title: 'app_name'.tr(context)),
      drawer: SeratDrawer(),
      body: DefaultTabController(
        length: 5,
        child: Center(
          child: Column(
            children: [
              // Top status view
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .195,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  gradient: const LinearGradient(
                      colors: [Color(0xFF9055FF), Color(0xFFDF98FA)]),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF9055FF).withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 10), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<QuranCubit, QuranState>(
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/icons/last_read.png'),
                                    width: 30,
                                  ),
                                  Text(
                                    'last_status'.tr(context),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'BTitr',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              state.status == QuranStatus.lastSeen
                                  ? Text(
                                      state.lastSeen!['surahName'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Amiri',
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : Container(),
                              state.status == QuranStatus.lastSeen
                                  ? Row(
                                      children: [
                                        Text(
                                          'ayah'.tr(context),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'BZar',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          state.lastSeen!['verseNumber']
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'BZar',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    )
                                  : Container(),
                            ],
                          );
                        },
                      ),
                      Image.asset(
                        'assets/namaz_logo.png',
                        width: MediaQuery.of(context).size.width * .3,
                      ),
                    ],
                  ),
                ),
              ),
              // Tabbar view
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Stack(
                  fit: StackFit.passthrough,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: const Color(0xff8789A3).withOpacity(0.2),
                              width: 1.0),
                        ),
                      ),
                    ),
                    TabBar(
                        indicatorColor: const Color(0xFF672CBC),
                        labelColor: const Color(0xFF672CBC),
                        dividerColor: Colors.green,
                        unselectedLabelColor: const Color(0xFF8789A3),
                        isScrollable: true,
                        indicatorWeight: 3,
                        labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'BTitr'),
                        tabs: [
                          TabItem(title: 'surah'.tr(context)),
                          TabItem(title: 'page'.tr(context)),
                          TabItem(title: 'ayah'.tr(context)),
                          TabItem(title: 'juz'.tr(context)),
                        ]),
                  ],
                ),
              ),
              // Tabbar contents
              SizedBox(
                height: MediaQuery.of(context).size.height * .56,
                child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const Surah(),
                      pg.Page(
                          appRepository:
                              context.read<QuranCubit>().appRepository),
                      Verses(
                          appRepository:
                              context.read<QuranCubit>().appRepository),
                      Juz(
                          appRepository:
                              context.read<QuranCubit>().appRepository)
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
