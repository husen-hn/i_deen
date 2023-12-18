//
//  reding_appbar.dart
//  Created on 2023 18 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serat/services/helper/l10n/app_local.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/services/helper/serat_icon.dart';

class ReadingAppbar extends StatelessWidget implements PreferredSizeWidget {
  final int pageNumber;
  final int juzNumber;
  const ReadingAppbar(
      {super.key, required this.pageNumber, required this.juzNumber})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${'page'.tr(context)} $pageNumber",
            style: TextStyle(
                fontFamily: SeratFont.bZar.name,
                fontWeight: FontWeight.w900,
                fontSize: 20),
          ),
          Text(
            "${'juz'.tr(context)} $juzNumber",
            style: TextStyle(
                color: const Color(0xFF8789A3),
                fontFamily: SeratFont.bZar.name,
                fontWeight: FontWeight.w900,
                fontSize: 12),
          )
        ],
      ),
      shadowColor: Colors.transparent,
      leading: GestureDetector(
          child: Image.asset(SeratIcon.backRTL.name),
          onTap: () {
            context.router.pop();
          }),
    );
  }

  @override
  final Size preferredSize;
}
