//
//  articles_cubit.dart
//  Created on 2023 12 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:serat/services/app/app_repository.dart';
import 'package:serat/services/articles/articles_repository.dart';
import 'package:serat/services/helper/articles_fail_schema.dart';
import 'package:serat/services/helper/articles_success_schema.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  AppRepository appRepository;
  ArticlesRepository articlesRepository;
  ArticlesCubit({required this.appRepository, required this.articlesRepository})
      : super(const ArticlesState().copyWith(
          status: () => ArticlesStatus.init,
        ));

  int totalArticlesPage = 100;
  int currentArticlesPage = 1;
  bool isLoading = false;
  List<ArticlesSuccessSchema> articles = [];

  getArticles(int page) async {
    isLoading = true;

    // not display fullscreen loading on every page changes, just display it on first time
    if (currentArticlesPage == 1) {
      emit(state.copyWith(
        status: () => ArticlesStatus.loading,
      ));
    }

    Either<ArticlesFailSchema, List<ArticlesSuccessSchema>> res =
        await articlesRepository.getArticlesData(page: page);

    res.match(
        (l) => emit(state.copyWith(
            status: () => ArticlesStatus.error,
            isFirstPage: () => currentArticlesPage == 1)), (r) {
      articles.addAll(r);
      emit(state.copyWith(
          status: () => ArticlesStatus.done, response: () => articles));
    });

    isLoading = false;
  }

  ScrollController scrollController = ScrollController();
  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (!isLoading && currentArticlesPage < totalArticlesPage) {
        currentArticlesPage++;
        getArticles(currentArticlesPage);
      }
    }
  }

  //////////////////////////////
  // String baseLink = 'https://www.namaz.ir/news/notes/';

  // late InAppWebViewController inAppWebViewController;

  // onWebCreatedWebView(InAppWebViewController controller) {
  //   inAppWebViewController = controller;
  // }

  // onProgressChangedWebView(InAppWebViewController controller, int progress) {
  //   if (progress > 65) {
  //     emit(state.copyWith(
  //       status: () => ArticlesStatus.done,
  //     ));
  //   }
  // }
  ///////////////////////////////////////
}
