//
//  article_reading.dart
//  Created on 2024 23 March.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as f_html;
import 'package:fpdart/fpdart.dart' as fp;
import 'package:serat/controller/ad/ad_cubit.dart';
import 'package:serat/controller/app/app_cubit.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/widgets/serat_appbar_detail.dart';
import 'package:serat/services/helper/ad_type.dart';
import 'package:serat/ui/ad/ad.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage(name: 'ArticleReadingRoute')
class ArticleReading extends StatelessWidget {
  final String mainImg;
  final String title;
  final String langCode;
  final String content;
  final AppRepository appRepository;
  const ArticleReading(
      {super.key,
      required this.mainImg,
      required this.title,
      required this.langCode,
      required this.content,
      required this.appRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AdCubit>(
              create: (BuildContext context) => AdCubit(
                  appRepository: context.read<AppCubit>().appRepository))
        ],
        child: ArticleReadingView(
            mainImg: mainImg,
            title: title,
            langCode: langCode,
            content: content,
            appRepository: appRepository));
  }
}

class ArticleReadingView extends StatefulWidget {
  final String mainImg;
  final String title;
  final String langCode;
  final String content;
  final AppRepository appRepository;
  const ArticleReadingView(
      {super.key,
      required this.mainImg,
      required this.title,
      required this.langCode,
      required this.content,
      required this.appRepository});

  @override
  State<ArticleReadingView> createState() => _ArticleReadingViewState();
}

class _ArticleReadingViewState extends State<ArticleReadingView> {
  @override
  void initState() {
    super.initState();

    // get rewarded ad on article reading opening
    if (Random().nextInt(3) == 0) {
      context.read<AdCubit>().getRewardedAd();
    }
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    List sContent = widget.content.split('<img');

    return Scaffold(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        appBar: SeratAppbarDetail(title: widget.title),
        body: Center(
            child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Image.network(
                    widget.mainImg,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .3,
                          color: Colors.grey,
                          child: const Center(
                              child: Icon(Icons.image_outlined,
                                  color: Colors.white, size: 20)));
                    },
                  )),
              ...sContent.mapWithIndex(
                (cntnt, index) => Column(
                  children: [
                    index != 0
                        ? SizedBox(
                            height: MediaQuery.of(context).size.width,
                            child: Ad(
                                appRepository: widget.appRepository,
                                adType: AdType.nativeAd),
                          )
                        : Container(),
                    f_html.Html(
                      data: index == 0 ? cntnt : '<img $cntnt',
                      shrinkWrap: true,
                      style: {
                        "*": f_html.Style(
                            fontFamily: SeratFont.bZar.name,
                            fontSize: f_html.FontSize.large,
                            textAlign: TextAlign.justify),
                        'img': f_html.Style(
                          width: f_html.Width(MediaQuery.of(context).size.width,
                              f_html.Unit.auto),
                          height: f_html.Height(
                              MediaQuery.of(context).size.width * 0.6,
                              f_html.Unit.auto),
                        )
                      },
                      onLinkTap: (url, attributes, element) => _launchUrl(url),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
