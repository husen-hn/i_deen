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
              fontSize: size / 4,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
