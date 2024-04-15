//
//  serat_drawer.dart
//  Created on 2023 27 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serat/serat_router.dart';
import 'package:serat/services/helper/serat_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class SeratDrawer extends StatelessWidget {
  const SeratDrawer({super.key});

  @override
  Drawer build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF9055FF), Color(0xFFDF98FA)]),
            ),
            child: Image.asset(SeratIcon.appIconShadow.name),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text(
              'تنظیمات',
              style: TextStyle(fontFamily: 'BZar'),
            ),
            onTap: () {
              Navigator.pop(context);
              context.router.push(const SettingsRoute());
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text(
              'درباره ما',
              style: TextStyle(fontFamily: 'BZar'),
            ),
            onTap: () {
              Navigator.pop(context);
              context.router.push(const AboutUsRoute());
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback_outlined),
            title: const Text(
              'پیشنهادات و انتقادات',
              style: TextStyle(fontFamily: 'BZar'),
            ),
            onTap: () {
              launchUrl(Uri.parse('mailto:hosseinspell@gmail.com'));
            },
          )
        ],
      ),
    );
  }
}
