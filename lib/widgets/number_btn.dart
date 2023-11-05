import 'package:flutter/material.dart';
import 'package:i_deen/widgets/surah_number.dart';

class NumberBtn extends StatelessWidget {
  final int number;
  final Color? iconColor;
  final Color? textColor;
  final double size;
  const NumberBtn(
      {super.key,
      required this.number,
      this.iconColor,
      this.textColor,
      this.size = 60});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: const Color(0xFF8789A3).withOpacity(0.3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: SurahNumber(
          number: number,
          iconColor: iconColor,
          textColor: textColor,
          size: size),
    );
  }
}
