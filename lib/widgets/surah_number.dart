//
//  surah_number.dart
//  Created on 2023 12 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';

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
            child: Image.asset('assets/icons/ayah.png', color: iconColor)),
        Text(
          number.toString(),
          style: TextStyle(
              color: textColor,
              fontFamily: 'BTitr',
              fontSize: size / 5,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
