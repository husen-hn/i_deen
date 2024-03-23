//
//  articles_reading.dart
//  Created on 2024 23 March.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/widgets/serat_appbar.dart';
import 'package:serat/widgets/serat_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage(name: 'ArticleReadingRoute')
class ArticleReading extends StatelessWidget {
  final String title;
  final String langCode;
  final String content;
  const ArticleReading(
      {super.key,
      required this.title,
      required this.langCode,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        appBar: SeratAppbar(langCode: langCode, title: title),
        drawer: SeratDrawer(),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
          child: HtmlWidget(
            content,
            // customWidgetBuilder: (element) {
            //   if (element.attributes['foo'] == 'bar') {
            //     // render a custom block widget that takes the full width
            //     return FooBarWidget();
            //   }

            //   if (element.attributes['fizz'] == 'buzz') {
            //     // render a custom widget inline with surrounding text
            //     return InlineCustomWidget(
            //       child: FizzBuzzWidget(),
            //     )
            //   }

            //   return null;
            // },
            onTapUrl: (url) => _launchUrl(url),
            renderMode: RenderMode.listView,
            textStyle: TextStyle(
                color: const Color(0xFF240F4F),
                fontFamily: SeratFont.bZar.name,
                fontSize: 20),
          ),
        )));
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
