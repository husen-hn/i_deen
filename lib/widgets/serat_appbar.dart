//
//  serat_appbar.dart
//  Created on 2023 12 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/services/helper/serat_icon.dart';

class SeratAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String langCode;
  final String title;
  const SeratAppbar({super.key, required this.langCode, required this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            fontFamily: SeratFont.amiri.name,
            fontWeight: FontWeight.w900,
            fontSize: 24),
      ),
      shadowColor: Colors.transparent,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Image.asset(
              langCode == 'fa' || langCode == 'ar'
                  ? SeratIcon.menuRTL.name
                  : SeratIcon.menu.name,
              height: 14,
              color: const Color.fromARGB(255, 53, 53, 61),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      // actions: [
      // Image.asset(
      //   langCode == 'fa' || langCode == 'ar'
      //       ? 'assets/icons/search_rtl.png'
      //       : 'assets/icons/search.png',
      // )
      // ],
    );
  }

  @override
  final Size preferredSize;
}
