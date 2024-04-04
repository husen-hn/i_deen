//
//  about_us.dart
//  Created on 2023 28 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serat/services/helper/l10n/app_local.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/services/helper/serat_icon.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage(name: 'AboutUsRoute')
class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
        title: Text(
          'درباره ما',
          style: TextStyle(
              fontFamily: SeratFont.bZar.name,
              fontWeight: FontWeight.w900,
              fontSize: 20),
        ),
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
      ),
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            const SizedBox(height: 20),
            Text(
              "${'app_name'.tr(context)} اپلیکیشن تلاوت و ختم قرآن به همراه مقالات نمازی",
              textAlign: TextAlign.right,
              style: TextStyle(fontFamily: SeratFont.bZar.name, fontSize: 20),
            ),
            const SizedBox(height: 40),
            Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[850]),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: _copyRightView()),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "توسعه داده شده توسط",
                  textAlign: TextAlign.right,
                  style:
                      TextStyle(fontFamily: SeratFont.bZar.name, fontSize: 18),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () => _launchUrl('https://github.com/husen-hn'),
                  child: const Text(
                    "Husen",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "اسپانسر:",
                  textAlign: TextAlign.right,
                  style:
                      TextStyle(fontFamily: SeratFont.bZar.name, fontSize: 18),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () =>
                      _launchUrl('https://www.namaz.ir/azrbaijan-gharbi'),
                  child: Text(
                    "ستاد اقامه نماز آذربایجان غربی",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: SeratFont.bZar.name,
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "راه های ارتباطی:",
                  textAlign: TextAlign.right,
                  style:
                      TextStyle(fontFamily: SeratFont.bZar.name, fontSize: 18),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () => _launchUrl('https://t.me/lxhusen'),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      "@lxhusen",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: SeratFont.bZar.name,
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _copyRightView() {
    return Directionality(
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
                style: TextStyle(color: Colors.white),
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
                style: TextStyle(color: Colors.white),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "fonts are licensed under the",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
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
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
