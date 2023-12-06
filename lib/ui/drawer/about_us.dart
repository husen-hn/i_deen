//
//  about_us.dart
//  Created on 2023 28 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//
import 'package:flutter/material.dart';
import 'package:serat/services/helper/l10n/app_local.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'درباره ما',
          style: TextStyle(
              fontFamily: 'BZar', fontWeight: FontWeight.w900, fontSize: 20),
        ),
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          child: Image.asset('assets/icons/back_rtl.png'),
          onTap: () => context.pop(),
        ),
      ),
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            Image.asset('assets/app_logo.png',
                width: MediaQuery.of(context).size.width * .5),
            const SizedBox(height: 20),
            Text(
              "${'app_name'.tr(context)} اپلیکیشن تلاوت و ختم قرآن به همراه مقالات نمازی",
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'BZar', fontSize: 24),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "توسعه داده شده توسط",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'BZar', fontSize: 20),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () => _launchUrl('https://github.com/husen-hn'),
                  child: const Text(
                    "Husen",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "اسپانسر:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'BZar', fontSize: 20),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () =>
                      _launchUrl('https://www.namaz.ir/azrbaijan-gharbi'),
                  child: const Text(
                    "ستاد اقامه نماز آذربایجان غربی",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'BZar',
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              "راه های ارتباطی",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'BZar', fontSize: 24),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => _launchUrl('mailto://husen.hn@proton.me'),
              child: const Text(
                "husen.hn@proton.me",
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontFamily: 'BZar',
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => _launchUrl('https://t.me/lxhusen'),
              child: const Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  "@lxhusen",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: 'BZar',
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
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
