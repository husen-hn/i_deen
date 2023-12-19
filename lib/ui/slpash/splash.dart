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
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/services/helper/serat_icon.dart';

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

    Future.delayed(const Duration(milliseconds: 20), () {
      context.router.replace(const HomeRoute());
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "app_name".tr(context),
                  style: TextStyle(
                      fontFamily: SeratFont.amiri.name,
                      fontWeight: FontWeight.w900,
                      fontSize: 34,
                      color: const Color.fromRGBO(103, 44, 188, 1)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .07,
                ),
                Text("app_introduce".tr(context),
                    style: TextStyle(
                        fontFamily: SeratFont.bZar.name,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(135, 137, 163, 1))),
                const SizedBox(height: 10),
                Text("prophet_muhammad_message".tr(context),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: SeratFont.bZar.name,
                        fontSize: 18,
                        color: const Color.fromRGBO(135, 137, 163, 1))),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .6,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(144, 85, 255, 1),
                      Color.fromRGBO(223, 152, 250, 1)
                    ]),
                    boxShadow: [
                      BoxShadow(
                          color: const Color.fromRGBO(144, 85, 255, 1)
                              .withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: const Offset(0, 10))
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                          top: 10,
                          child: Image.asset(SeratIcon.star.name, width: 14)),
                      Positioned(
                          top: 20,
                          left: 50,
                          child: Image.asset(SeratIcon.star.name, width: 9)),
                      Positioned(
                          top: 105,
                          right: 30,
                          child: Image.asset(SeratIcon.star.name, width: 10)),
                      Positioned(
                          top: 80,
                          right: 60,
                          child: Image.asset(SeratIcon.star.name, width: 14)),
                      Positioned(
                          top: 145,
                          left: 35,
                          child: Image.asset(
                            SeratIcon.star.name,
                            width: 10,
                          )),
                      Positioned(
                          top: 45,
                          left: 65,
                          child: Image.asset(
                            SeratIcon.star.name,
                            width: 10,
                          )),
                      Positioned(
                          top: 35,
                          right: 65,
                          child: Image.asset(
                            SeratIcon.star.name,
                            width: 10,
                          )),
                      Positioned(
                          top: 105,
                          right: 110,
                          child: Image.asset(
                            SeratIcon.star.name,
                            width: 10,
                          )),
                      Positioned(
                          top: 105,
                          left: 110,
                          child: Image.asset(SeratIcon.star.name, width: 20)),
                      Positioned(
                          top: 80,
                          left: 10,
                          child: Image.asset(SeratIcon.star.name, width: 20)),
                      Positioned(
                          left: 0,
                          top: 90,
                          child: Image.asset(
                            SeratIcon.cloud1.name,
                            width: 106,
                          )),
                      Positioned(
                          left: 100,
                          top: 60,
                          child: Image.asset(
                            SeratIcon.cloud2.name,
                            width: 82,
                          )),
                      Positioned(
                          right: 0,
                          top: 110,
                          child: Image.asset(
                            SeratIcon.cloud3.name,
                            width: 106,
                          )),
                      Positioned(
                        bottom: 80,
                        child: Image.asset(
                          SeratIcon.appIconShadow.name,
                          width: MediaQuery.of(context).size.width * .7,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * .05,
                ),
                const CircularProgressIndicator(
                  color: Color.fromRGBO(103, 44, 188, 1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
