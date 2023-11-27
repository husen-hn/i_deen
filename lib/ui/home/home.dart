//
//  home.dart
//  Created on 2023 31 October.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_deen/controller/app/app_cubit.dart';
import 'package:i_deen/controller/home/home_cubit.dart';
import 'package:i_deen/ui/bookmark/bookmark.dart';
import 'package:i_deen/ui/finish/finish.dart';
// import 'package:i_deen/ui/pray/pray.dart';
import 'package:i_deen/ui/prayer/prayer.dart';
import 'package:i_deen/ui/quran/quran.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<HomeCubit>(create: (BuildContext context) => HomeCubit())
    ], child: const HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) => BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: state.btnNvIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/quran_icon.png',
                      color: context
                          .read<HomeCubit>()
                          .activeBtnNavColor(state.btnNvIndex, 0)),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/lamp_icon.png',
                      color: context
                          .read<HomeCubit>()
                          .activeBtnNavColor(state.btnNvIndex, 1)),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/prayer_icon.png',
                      color: context
                          .read<HomeCubit>()
                          .activeBtnNavColor(state.btnNvIndex, 2)),
                  label: ''),
              // BottomNavigationBarItem(
              //     icon: Image.asset('assets/icons/pray_icon.png',
              //         color: context
              //             .read<HomeCubit>()
              //             .activeBtnNavColor(state.btnNvIndex, 3)),
              //     label: ''),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/bookmark_icon.png',
                      color: context
                          .read<HomeCubit>()
                          .activeBtnNavColor(state.btnNvIndex, 3)),
                  label: ''),
            ],
            onTap: (int index) {
              context.read<HomeCubit>().setActiveButtonIndex(index);
            },
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => state.btnNvIndex == 0
                ? Quran(
                    appRepository: context.read<AppCubit>().appRepository,
                  )
                : state.btnNvIndex == 1
                    ? const Finish()
                    : state.btnNvIndex == 2
                        ? const Prayer()
                        // : state.btnNvIndex == 3
                        //     ? const Pray()
                        : const Bookmark()));
  }
}
