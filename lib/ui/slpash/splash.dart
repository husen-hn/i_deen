//
//  splash.dart
//  Created on 2023 31 October.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:i_deen/services/l10n/app_local.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(milliseconds: 500), () {
      context.go('/home');
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "app_name".tr(context),
                  style: const TextStyle(
                      fontFamily: 'BTitr',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF672CBC)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .07,
                ),
                Text("app_introduce".tr(context),
                    style: const TextStyle(
                        fontFamily: 'BZar',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8789A3))),
                Text("prophet_muhammad_message".tr(context),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'BZar',
                        fontSize: 18,
                        color: Color(0xFF8789A3))),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .1,
                ),
                Image(
                  image: const AssetImage('assets/splash.png'),
                  width: MediaQuery.of(context).size.width * .8,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .05,
                ),
                const CircularProgressIndicator(
                  color: Color(0xFF672CBC),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
