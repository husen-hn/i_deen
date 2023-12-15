//
//  surah_number.dart
//  Created on 2023 12 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:serat/services/helper/serat_icon.dart';

class SurahNumber extends StatelessWidget {
  final int number;
  final Color? iconColor;
  final Color? textColor;
  final double size;
  const SurahNumber(
      {super.key,
      required this.number,
      this.iconColor,
      this.textColor,
      this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            width: size,
            height: size,
            child: Image.asset(SeratIcon.verse.name, color: iconColor)),
        Text(
          number.toString(),
          style: TextStyle(
              color: textColor,
              fontFamily: 'BTitr',
              fontSize: size / 3,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
