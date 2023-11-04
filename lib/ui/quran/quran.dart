//
//  quran.dart
//  Created on 2023 31 October.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_deen/controller/quran/quran_cubit.dart';
import 'package:i_deen/ui/quran/tabs/ayah.dart';
import 'package:i_deen/ui/quran/tabs/juz.dart';
import 'package:i_deen/ui/quran/tabs/page.dart' as PG;
import 'package:i_deen/ui/quran/tabs/surah.dart';
import 'package:i_deen/widgets/tab_item.dart';
import 'package:i_deen/services/l10n/app_local.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<QuranCubit>(create: (BuildContext context) => QuranCubit())
    ], child: const QuranView());
  }
}

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Center(
        child: Column(
          children: [
            // Top status view
            Stack(
              alignment: Alignment.center,
              children: [
                Image(
                  image: const AssetImage('assets/last_read_bg.png'),
                  width: MediaQuery.of(context).size.width * .9,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                    top: 20,
                    left: MediaQuery.of(context).size.width * .06,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/last_read.png'),
                              width: 30,
                            ),
                            Text(
                              'last_status'.tr(context),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'BTitr',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'الفاتحة',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Amiri',
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Text(
                              'ayah'.tr(context),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'BZar',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              '24',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'BZar',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
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
              child: const TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: [Surah(), PG.Page(), Ayah(), Juz()]),
            )
          ],
        ),
      ),
    );
  }
}
