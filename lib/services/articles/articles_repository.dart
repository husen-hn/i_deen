//
//  articles_repository.dart
//  Created on 2024 21 March.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:fpdart/fpdart.dart';
import 'package:serat/services/articles/articles.dart';
import 'package:serat/services/helper/articles_fail_schema.dart';
import 'package:serat/services/helper/articles_success_schema.dart';

abstract class IArticlesRepository {
  Future<Either<ArticlesFailSchema, List<ArticlesSuccessSchema>>>
      getArticlesData({required int page});
}

class ArticlesRepository implements IArticlesRepository {
  ArticlesRepository();
  final Articles _articles = Articles();

  @override
  Future<Either<ArticlesFailSchema, List<ArticlesSuccessSchema>>>
      getArticlesData({required int page}) =>
          _articles.getArticlesData(page: page);
}
