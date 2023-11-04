import 'package:flutter/material.dart';

class SurahNumber extends StatelessWidget {
  final int number;
  const SurahNumber({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('assets/icons/ayah.png'),
        Text(
          number.toString(),
          style: const TextStyle(
              color: Color(0xFF240F4F),
              fontFamily: 'BTitr',
              fontSize: 14,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
