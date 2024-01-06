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
  final String surahName;
  final int pageNumber;
  final int juzNumber;
  final int hizbNumber;
  const ReadingAppbar(
      {super.key,
      required this.surahName,
      required this.pageNumber,
      required this.juzNumber,
      required this.hizbNumber})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${'page'.tr(context)} $pageNumber",
                style: TextStyle(
                    fontFamily: SeratFont.bZar.name,
                    fontWeight: FontWeight.w900,
                    fontSize: 20),
              ),
              const SizedBox(height: 5),
              Text(
                surahName,
                style: TextStyle(
                    color: const Color(0xFF8789A3),
                    fontFamily: SeratFont.bZar.name,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${'juz'.tr(context)} $juzNumber",
                style: TextStyle(
                    color: const Color(0xFF8789A3),
                    fontFamily: SeratFont.bZar.name,
                    fontWeight: FontWeight.w900,
                    fontSize: 12),
              ),
              Text(
                "${'juz'.tr(context)} $hizbNumber",
                style: TextStyle(
                    color: const Color(0xFF8789A3),
                    fontFamily: SeratFont.bZar.name,
                    fontWeight: FontWeight.w900,
                    fontSize: 12),
              )
            ],
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      surfaceTintColor: const Color.fromRGBO(250, 250, 250, 1),
      shadowColor: Colors.transparent,
      leading: IconButton(
          icon: Image.asset(
            SeratIcon.backRTL.name,
            height: 16,
            color: const Color.fromRGBO(135, 137, 163, 1),
          ),
          onPressed: () {
            context.router.pop();
          }),
    );
  }

  @override
  final Size preferredSize;
}
