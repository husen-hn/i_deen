//
//  serat_drawer.dart
//  Created on 2023 27 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_deen/services/helper/l10n/app_local.dart';
import 'package:url_launcher/url_launcher.dart';

class SeratDrawer extends StatelessWidget {
  SeratDrawer({super.key});

  final Uri _url = Uri.parse('https://www.namaz.ir/azrbaijan-gharbi/');

  @override
  Drawer build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset('assets/app_logo.png'),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text(
              'درباره ما',
              style: TextStyle(fontFamily: 'BZar'),
            ),
            onTap: () {
              Navigator.pop(context);
              context.pushNamed(
                'about-us',
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.copyright_outlined),
            title: const Text(
              'کپی رایت',
              style: TextStyle(fontFamily: 'BZar'),
            ),
            onTap: () {
              Navigator.pop(context);
              context.pushNamed(
                'copy-right',
              );
            },
          ),
          Expanded(
              child: Container(
            height: 200,
          )),
          InkWell(
              onTap: () => _launchUrl(),
              child: SizedBox(
                  width: 200, child: Image.asset('assets/namaz_logo_ag.png'))),
          Container(
              padding: const EdgeInsets.only(bottom: 15.0, top: 5.0),
              child: Text('sponsor'.tr(context),
                  style: const TextStyle(fontSize: 14, fontFamily: 'BZar'))),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
