//
//  splash.dart
//  Created on 2023 31 October.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serat/serat_router.dart';
import 'package:serat/services/helper/l10n/app_local.dart';

@RoutePage(name: 'SplashRoute')
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    Future.delayed(const Duration(milliseconds: 2000), () {
      context.router.push(const HomeRoute());
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    });
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
                      fontFamily: 'Amiri',
                      fontWeight: FontWeight.w900,
                      fontSize: 34,
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
                const SizedBox(height: 10),
                Text("prophet_muhammad_message".tr(context),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'BZar',
                        fontSize: 18,
                        color: Color(0xFF8789A3))),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .6,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    gradient: const LinearGradient(
                        colors: [Color(0xFF9055FF), Color(0xFFDF98FA)]),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF9055FF).withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: const Offset(0, 10))
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                          top: 10, child: Image.asset('assets/icons/star.png')),
                      Positioned(
                          top: 20,
                          left: 50,
                          child: Image.asset('assets/icons/star.png')),
                      Positioned(
                          top: 40,
                          right: 30,
                          child: Image.asset('assets/icons/star.png')),
                      Positioned(
                          top: 80,
                          right: 60,
                          child: Image.asset('assets/icons/star.png')),
                      Positioned(
                          top: 15,
                          left: 35,
                          child: Image.asset(
                            'assets/icons/star.png',
                            width: 10,
                          )),
                      Positioned(
                          top: 45,
                          left: 65,
                          child: Image.asset(
                            'assets/icons/star.png',
                            width: 10,
                          )),
                      Positioned(
                          top: 35,
                          right: 65,
                          child: Image.asset(
                            'assets/icons/star.png',
                            width: 10,
                          )),
                      Positioned(
                          top: 55,
                          right: 110,
                          child: Image.asset(
                            'assets/icons/star.png',
                            width: 10,
                          )),
                      Positioned(
                          top: 55,
                          left: 110,
                          child: Image.asset(
                            'assets/icons/star.png',
                          )),
                      Positioned(
                          top: 80,
                          left: 10,
                          child: Image.asset(
                            'assets/icons/star.png',
                          )),
                      Positioned(
                          left: 0,
                          top: 90,
                          child: Image.asset('assets/icons/cloud1.png')),
                      Positioned(
                          left: 100,
                          top: 60,
                          child: Image.asset('assets/icons/cloud2.png')),
                      Positioned(
                          right: 0,
                          top: 110,
                          child: Image.asset('assets/icons/cloud3.png')),
                      Positioned(
                        bottom: 40,
                        child: Image.asset(
                          'assets/namaz-logo-name.png',
                          width: MediaQuery.of(context).size.width * .4,
                        ),
                      ),
                    ],
                  ),
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
