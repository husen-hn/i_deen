//
//  app.dart
//  Created on 2023 20 August.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_deen/controller/app/app_cubit.dart';
import 'package:i_deen/i_deen_router.dart';
import 'package:i_deen/services/app/app_repository.dart';

class App extends StatelessWidget {
  final AppRepository appRepository;

  const App({required this.appRepository, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: appRepository),
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider<AppCubit>(
              create: (BuildContext abContext) =>
                  AppCubit(appRepository: appRepository))
        ], child: const AppView()));
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // change system statusBar & navBar color
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFAFAFA),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFFAFAFA),
        systemNavigationBarIconBrightness: Brightness.dark));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: context.read<AppCubit>().appTheme,
      supportedLocales: context.read<AppCubit>().l10n,
      localizationsDelegates: context.read<AppCubit>().l10nDelegates,
      localeResolutionCallback: (currentLocal, supportedLocales) {
        return Locale(context.read<AppCubit>().getSavedLanguage());
      },
      routerConfig: IDeenRouter().router,
    );
  }
}
