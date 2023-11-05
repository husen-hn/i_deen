import 'package:flutter/material.dart';
import 'package:i_deen/services/l10n/app_local.dart';
import 'package:i_deen/widgets/surah_number.dart';

class SurahItem extends StatelessWidget {
  final int index;
  final String title;
  final String type;
  final int versesCount;
  const SurahItem(
      {super.key,
      required this.index,
      required this.title,
      required this.type,
      required this.versesCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SurahNumber(
                  number: index + 1,
                  iconColor: const Color(0xFF994EF8),
                  textColor: const Color(0xFF240F4F),
                  size: 60,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Color(0xFF240F4F),
                        fontFamily: 'Amiri',
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(type,
                          style: const TextStyle(
                              color: Color(0xFF8789A3),
                              fontFamily: 'BZar',
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('$versesCount ${'ayah'.tr(context)}',
                          style: const TextStyle(
                              color: Color(0xFF8789A3),
                              fontFamily: 'BZar',
                              fontSize: 16,
                              fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_right,
                color: Color(0xFF994EF8),
              ))
        ],
      ),
    );
  }
}
