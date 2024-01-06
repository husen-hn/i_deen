//
//  home.dart
//  Created on 2023 31 October.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:serat/controller/app/app_cubit.dart';
import 'package:serat/controller/home/home_cubit.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/services/helper/serat_icon.dart';
import 'package:serat/ui/bookmark/bookmark.dart';
import 'package:serat/ui/finish/finish.dart';
import 'package:serat/ui/prayer/prayer.dart';
import 'package:serat/ui/quran/quran.dart';

@RoutePage(name: 'HomeRoute')
class Home extends StatelessWidget {
  final AppRepository appRepository;
  const Home({required this.appRepository, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<HomeCubit>(
          create: (BuildContext context) =>
              HomeCubit(appRepository: appRepository)),
    ], child: const HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().checkConnection();
    return Scaffold(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        bottomNavigationBar: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state.status == HomeStatus.initial) {
              if (state.vpnConnection == true) {
                MotionToast.warning(
                        position: MotionToastPosition.top,
                        toastDuration: const Duration(seconds: 5),
                        title: Text('اینترنت غیر از ایران',
                            style: TextStyle(fontFamily: SeratFont.bTitr.name)),
                        description: Text(
                            "جهت بهبود عملکرد فیلترشکن خود را خاموش کنید.",
                            style: TextStyle(fontFamily: SeratFont.bZar.name)))
                    .show(context);
              } else if (state.networkConnection == false) {
                MotionToast.error(
                        position: MotionToastPosition.top,
                        toastDuration: const Duration(seconds: 5),
                        title: Text('عدم دسترسی به اینترنت',
                            style: TextStyle(fontFamily: SeratFont.bTitr.name)),
                        description: Text(
                            "جهت بهبود عملکرد اینترنت خود را روشن کنید.",
                            style: TextStyle(fontFamily: SeratFont.bZar.name)))
                    .show(context);
              }
            }
          },
          builder: (context, state) => Container(
            decoration: const BoxDecoration(
                border:
                    Border(top: BorderSide(width: 0.5, color: Colors.grey))),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              currentIndex: state.btnNvIndex,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Image.asset(SeratIcon.quran.name,
                        width: 35,
                        height: 35,
                        color: context
                            .read<HomeCubit>()
                            .activeBtnNavColor(state.btnNvIndex, 0)),
                    backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Image.asset(SeratIcon.prayerIcon.name,
                        width: 35,
                        height: 35,
                        color: context
                            .read<HomeCubit>()
                            .activeBtnNavColor(state.btnNvIndex, 1)),
                    backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Image.asset(SeratIcon.lamp.name,
                        width: 35,
                        height: 35,
                        color: context
                            .read<HomeCubit>()
                            .activeBtnNavColor(state.btnNvIndex, 2)),
                    backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Image.asset(SeratIcon.bookmark.name,
                        width: 35,
                        height: 35,
                        color: context
                            .read<HomeCubit>()
                            .activeBtnNavColor(state.btnNvIndex, 3)),
                    backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
                    label: ''),
              ],
              onTap: (int index) {
                context.read<HomeCubit>().setActiveButtonIndex(index);
              },
            ),
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => state.btnNvIndex == 0
                ? Quran(appRepository: context.read<AppCubit>().appRepository)
                : state.btnNvIndex == 1
                    ? Finish(
                        appRepository: context.read<AppCubit>().appRepository,
                      )
                    : state.btnNvIndex == 2
                        ? Prayer(
                            appRepository:
                                context.read<AppCubit>().appRepository)
                        : Bookmark(
                            appRepository:
                                context.read<AppCubit>().appRepository)));
  }
}
