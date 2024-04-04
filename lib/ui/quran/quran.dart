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
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/ui/quran/tabs/juz.dart';
import 'package:serat/ui/quran/tabs/page.dart' as pg;
import 'package:serat/ui/quran/tabs/surah.dart';
import 'package:serat/ui/quran/tabs/verses.dart';
import 'package:serat/widgets/last_seen_status.dart';
import 'package:serat/widgets/last_seen_status_shimmer.dart';
import 'package:serat/widgets/serat_appbar.dart';
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
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: SeratAppbar(langCode: langCode, title: 'app_name'.tr(context)),
      drawer: SeratDrawer(),
      body: DefaultTabController(
        length: 5,
        child: Center(
          child: Column(
            children: [
              // Top status view
              BlocBuilder<QuranCubit, QuranState>(
                  builder: (context, state) =>
                      state.status == QuranStatus.lastSeen
                          ? LastSeenStatus(
                              surahName: state.lastSeen!['surahName'],
                              verseNumber:
                                  state.lastSeen!['verseNumber'].toString())
                          : const LastSeenStatusShimmer()),
              // Tabbar view
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
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
                        dividerColor: Colors.grey,
                        dividerHeight: 0.5,
                        unselectedLabelColor: const Color(0xFF8789A3),
                        isScrollable: true,
                        indicatorWeight: 3,
                        labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: SeratFont.bTitr.name),
                        tabAlignment: TabAlignment.center,
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
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Surah(
                            appRepository:
                                context.read<QuranCubit>().appRepository),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
