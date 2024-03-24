//
//  serat_appbar_detail.dart
//  Created on 2024 24 March.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/services/helper/serat_icon.dart';

class SeratAppbarDetail extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const SeratAppbarDetail({super.key, required this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Html(data: "<p>$title</p>", style: {
        "p": Style(
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            color: const Color(0xFF672CBC),
            fontFamily: SeratFont.bTitr.name,
            fontSize: FontSize.large,
            fontWeight: FontWeight.bold),
      }),
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
