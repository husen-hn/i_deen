//
//  i_deen_appbar.dart
//  Created on 2023 12 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:i_deen/services/helper/l10n/app_local.dart';

class IDeenAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String langCode;
  const IDeenAppbar({super.key, required this.langCode})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(
        'app_name'.tr(context),
        style: const TextStyle(
            fontFamily: 'Amiri', fontWeight: FontWeight.w900, fontSize: 24),
      ),
      shadowColor: Colors.transparent,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Image.asset(
              langCode == 'fa' || langCode == 'ar'
                  ? 'assets/icons/menu_rtl.png'
                  : 'assets/icons/menu.png',
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: [
        Image.asset(
          langCode == 'fa' || langCode == 'ar'
              ? 'assets/icons/search_rtl.png'
              : 'assets/icons/search.png',
        )
      ],
    );
  }

  @override
  final Size preferredSize;
}
