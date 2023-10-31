//
//  splash.dart
//  Created on 2023 31 October.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

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

    Future.delayed(const Duration(seconds: 2), () {
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
                const Text(
                  'آی دین',
                  style: TextStyle(
                      fontFamily: 'BTitr',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF672CBC)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .07,
                ),
                const Text('اپلیکشنی برای قرآن و نماز و ذکرات',
                    style: TextStyle(
                        fontFamily: 'BZar',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF8789A3))),
                const Text('بهترین شما کسی است که قرآن را بیاموزد و آموزش دهد.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
