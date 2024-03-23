//
//  articles.dart
//  Created on 2023 31 October.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serat/controller/app/app_cubit.dart';
import 'package:serat/controller/articles/articles_cubit.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/articles/articles_repository.dart';
import 'package:serat/services/helper/l10n/app_local.dart';
import 'package:serat/services/helper/serat_font.dart';
import 'package:serat/ui/articles/article_thumbnail.dart';
import 'package:serat/ui/articles/articles_shimmer.dart';
import 'package:serat/widgets/serat_appbar.dart';
import 'package:serat/widgets/serat_drawer.dart';

class Articles extends StatelessWidget {
  final AppRepository appRepository;
  final ArticlesRepository articlesRepository;
  const Articles(
      {required this.appRepository,
      required this.articlesRepository,
      super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ArticlesCubit>(
              create: (BuildContext context) => ArticlesCubit(
                  appRepository: appRepository,
                  articlesRepository: articlesRepository))
        ],
        child: ArticlesView(
            appRepository: appRepository,
            articlesRepository: articlesRepository));
  }
}

class ArticlesView extends StatefulWidget {
  final AppRepository appRepository;
  final ArticlesRepository articlesRepository;
  const ArticlesView(
      {required this.appRepository,
      required this.articlesRepository,
      super.key});

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  @override
  void initState() {
    context.read<ArticlesCubit>().getArticles(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String langCode = context.read<AppCubit>().getSavedLanguage();

    return Scaffold(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        appBar: SeratAppbar(langCode: langCode, title: 'articles'.tr(context)),
        drawer: SeratDrawer(),
        body: SafeArea(child: BlocBuilder<ArticlesCubit, ArticlesState>(
            builder: (context, state) {
          if (state.status == ArticlesStatus.done) {
            return state.response!.match(
                (l) => Center(
                      child: Text(
                        'مشکلی رخ داده است.',
                        style: TextStyle(
                            color: const Color(0xFF240F4F),
                            fontFamily: SeratFont.bTitr.name,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                (r) => ListView.builder(
                    padding:
                        const EdgeInsets.only(top: 20, left: 10, right: 10),
                    itemCount: r.length,
                    itemBuilder: (context, index) => ArticleThumbnail(
                        img: r[index].yoastHeadJson?.ogImage.first.url ?? '',
                        title: r[index].title?.rendered ?? '',
                        description: r[index].excerpt?.rendered ?? '',
                        onTap: () {})));
          } else {
            return const ArticlesShimmer();
          }
        }))

        //     SafeArea(
        //         child: BlocBuilder<PrayerCubit, PrayerState>(
        //   builder: (context, state) => Stack(
        //     alignment: AlignmentDirectional.center,
        //     children: [
        //       InAppWebView(
        //         initialUrlRequest: URLRequest(
        //             url: Uri.parse(context.read<PrayerCubit>().baseLink)),
        //         onWebViewCreated: context.read<PrayerCubit>().onWebCreatedWebView,
        //         onProgressChanged:
        //             context.read<PrayerCubit>().onProgressChangedWebView,
        //       ),
        //       state.status == PrayerStatus.done
        //           ? Container()
        //           : const PrayerShimmer()
        //     ],
        //   ),
        // ))
        );
  }
}
