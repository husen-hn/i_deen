//
//  settings.dart
//  Created on 2023 28 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serat/services/helper/serat_icon.dart';

@RoutePage(name: 'SettingsRoute')
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
          title: const Text(
            'تنظیمات',
            style: TextStyle(
                fontFamily: 'BZar', fontWeight: FontWeight.w900, fontSize: 20),
          ),
          shadowColor: Colors.transparent,
          leading: IconButton(
              icon: Image.asset(
                SeratIcon.backRTL.name,
                height: 16,
                color: const Color.fromRGBO(135, 137, 163, 1),
              ),
              onPressed: () {
                context.router.pop();
              })),
      body: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: [],
          ),
        ),
      ),
    );
  }
}
