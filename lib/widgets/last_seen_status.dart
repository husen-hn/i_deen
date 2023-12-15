//
//  last_seen_status.dart
//  Created on 2023 15 December.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:serat/services/helper/l10n/app_local.dart';
import 'package:serat/services/helper/serat_asset.dart';
import 'package:serat/services/helper/serat_font.dart';

class LastSeenStatus extends StatelessWidget {
  final String surahName;
  final String verseNumber;
  const LastSeenStatus(
      {super.key, required this.surahName, required this.verseNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        gradient: const LinearGradient(
            colors: [Color(0xFF9055FF), Color(0xFFDF98FA)]),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9055FF).withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Image(
                          image: AssetImage('assets/icons/last_read.png'),
                          width: 25,
                        ),
                        Text(
                          'last_status'.tr(context),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: SeratFont.bTitr.name,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          surahName,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: SeratFont.amiri.name,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'ayah'.tr(context),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: SeratFont.bZar.name,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          verseNumber,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: SeratFont.bZar.name,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
                Image.asset(SeratAsset.appIcon.name,
                    width: MediaQuery.of(context).size.width * .4,
                    height: 70,
                    opacity: const AlwaysStoppedAnimation(.9)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
