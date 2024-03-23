//
//  articles_cubit.dart
//  Created on 2023 12 November.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:bloc/bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
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
      : super(const ArticlesState().copyWith());

  int articlesPage = 1;

  getArticles(int page) async {
    emit(state.copyWith(
      status: () => ArticlesStatus.loading,
    ));

    Either<ArticlesFailSchema, List<ArticlesSuccessSchema>> res =
        await articlesRepository.getArticlesData(page: page);

    emit(
        state.copyWith(status: () => ArticlesStatus.done, response: () => res));
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
