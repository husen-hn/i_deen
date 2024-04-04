//
//  articles.dart
//  Created on 2023 31 October.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:serat/controller/app/app_cubit.dart';
import 'package:serat/controller/articles/articles_cubit.dart';
import 'package:serat/serat_router.dart';
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

class ArticlesView extends StatelessWidget {
  final AppRepository appRepository;
  final ArticlesRepository articlesRepository;
  const ArticlesView(
      {required this.appRepository,
      required this.articlesRepository,
      super.key});

  @override
  Widget build(BuildContext context) {
    String langCode = context.read<AppCubit>().getSavedLanguage();

    return Scaffold(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        appBar: SeratAppbar(langCode: langCode, title: 'articles'.tr(context)),
        drawer: SeratDrawer(),
        body: SafeArea(
            child: BlocConsumer<ArticlesCubit, ArticlesState>(
                listener: (context, state) {
          if (state.status == ArticlesStatus.error) {
            if (!(state.isFirstPage ?? false)) {
              MotionToast.warning(
                  position: MotionToastPosition.top,
                  toastDuration: const Duration(seconds: 5),
                  title: Text('مشکلی رخ داده است',
                      style: TextStyle(fontFamily: SeratFont.bTitr.name)),
                  description: Text(
                      'مشکلی در اتصال اینترنت دستگاه شما رخ داده است',
                      style: TextStyle(fontFamily: SeratFont.bZar.name)));
            }
          } else if (state.status == ArticlesStatus.checkConnection) {
            if (state.vpnConnection == true) {
              MotionToast.warning(
                      position: MotionToastPosition.top,
                      toastDuration: const Duration(seconds: 5),
                      title: Text('اینترنت غیر از ایران',
                          style: TextStyle(fontFamily: SeratFont.bTitr.name)),
                      description: Text(
                          "جهت بهبود عملکرد فیلترشکن خود را خاموش کنید.",
                          style: TextStyle(fontFamily: SeratFont.bZar.name)))
                  .show(context);
            } else if (state.networkConnection == false) {
              MotionToast.error(
                      position: MotionToastPosition.top,
                      toastDuration: const Duration(seconds: 5),
                      title: Text('عدم دسترسی به اینترنت',
                          style: TextStyle(fontFamily: SeratFont.bTitr.name)),
                      description: Text(
                          "جهت بهبود عملکرد اینترنت خود را روشن کنید.",
                          style: TextStyle(fontFamily: SeratFont.bZar.name)))
                  .show(context);
            }
          }
        }, builder: (context, state) {
          if (state.status == ArticlesStatus.init) {
            context.read<ArticlesCubit>().checkConnection();
            context.read<ArticlesCubit>().getArticles(1);
            context
                .read<ArticlesCubit>()
                .scrollController
                .addListener(context.read<ArticlesCubit>().scrollListener);
            return const ArticlesShimmer();
          } else if (state.status == ArticlesStatus.done) {
            return _listView(context, state, langCode);
          } else if (state.status == ArticlesStatus.error) {
            // get error on first page display fullscreen error
            if (state.isFirstPage ?? false) {
              return Center(
                child: Text(
                  'مشکلی رخ داده است.',
                  style: TextStyle(
                      color: const Color(0xFF240F4F),
                      fontFamily: SeratFont.bTitr.name,
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
              );
            } else {
              return _listView(context, state, langCode);
            }
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

  _listView(BuildContext context, ArticlesState state, String langCode) {
    return ListView(
      controller: context.read<ArticlesCubit>().scrollController,
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            shrinkWrap: true,
            itemCount: state.response?.length ?? 0,
            itemBuilder: (context, index) => ArticleThumbnail(
                img: state.response?[index].yoastHeadJson?.ogImage.first.url ??
                    '',
                title: state.response?[index].title?.rendered ?? '',
                description: state.response?[index].excerpt?.rendered ?? '',
                onTap: () {
                  context.router.push(ArticleReadingRoute(
                    mainImg: state.response?[index].yoastHeadJson?.ogImage.first
                            .url ??
                        '',
                    title: state.response?[index].title?.rendered ?? '',
                    langCode: langCode,
                    content: state.response?[index].content?.rendered ?? '',
                    appRepository: appRepository,
                  ));
                })),
        const Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: CircularProgressIndicator(
              color: Color.fromRGBO(103, 44, 188, 1),
            ),
          ),
        )
      ],
    );
  }
}
