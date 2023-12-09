//
//  copy_right.dart
//  Created on 2023 28 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage(name: 'CopyRightRoute')
class CopyRight extends StatelessWidget {
  const CopyRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'کپی رایت',
          style: TextStyle(
              fontFamily: 'BZar', fontWeight: FontWeight.w900, fontSize: 20),
        ),
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          child: Image.asset('assets/icons/back_rtl.png'),
          onTap: () => context.router.pop(),
        ),
      ),
      body: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "UI & Icons:",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () => _launchUrl(
                        'https://www.figma.com/community/file/966921639679380402'),
                    child: const Text(
                      "@tanvir_ux",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Quran Package:",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () =>
                        _launchUrl('https://pub.dev/packages/quran/license'),
                    child: const Text(
                      "License",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "fonts are licensed under the",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () => _launchUrl(
                        'https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL'),
                    child: const Text(
                      "Open Font License.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                "Copyright © Serat Application, All Rights Reserved Unauthorized copying of this application, via any medium is strictly prohibited Proprietary and confidential Written by Husen <husen.hn@proton.me>, November 2023",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
