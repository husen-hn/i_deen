//
//  quran.dart
//  Created on 2023 31 October.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:i_deen/services/l10n/app_local.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image(
                image: const AssetImage('assets/last_read_bg.png'),
                width: MediaQuery.of(context).size.width * .8,
              ),
              Positioned(
                  top: 20,
                  left: MediaQuery.of(context).size.width * .06,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Image(
                            image: AssetImage('assets/icons/last_read.png'),
                            width: 30,
                          ),
                          Text(
                            'last_status'.tr(context),
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'BTitr',
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'الفاتحة',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Amiri',
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Text(
                            'ayah'.tr(context),
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'BZar',
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            '24',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'BZar',
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
