//
//  articles.dart
//  Created on 2024 21 March.
//  Copyright © husen-hn Github
//  Developed by 2023 Hossein HassanNejad.
//

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:serat/services/helper/articles_fail_schema.dart';
import 'package:serat/services/helper/articles_success_schema.dart';

class Articles {
  final Dio _dio = Dio();

  _configureDio() {
    _dio.options.baseUrl = 'https://www.namaz.ir/wp-json/wp/v2';
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  ArticlesFailSchema _statusErrorHandler(Response? response) {
    switch (response?.statusCode) {
      case 500:
        return ArticlesFailSchema(
            code: '500',
            message: "Server Error pls retry later",
            data: Data(status: 500));

      case 400:
        return ArticlesFailSchema(
            code: '400', message: 'Bad Request!', data: Data(status: 400));
      case 401:
        return ArticlesFailSchema(
            code: '401', message: 'Unauthorized!', data: Data(status: 401));
      case 403:
        return ArticlesFailSchema(
            code: '403',
            message: 'Error occurred pls check internet and retry.',
            data: Data(status: 403));
      case 404:
        return ArticlesFailSchema(
            code: '404', message: 'Not Found!', data: Data(status: 404));
      default:
        return ArticlesFailSchema(
            code: '', message: 'Error occurred!', data: Data(status: 0));
    }
  }

  Future<Either<ArticlesFailSchema, List<ArticlesSuccessSchema>>>
      getArticlesData({required int page}) async {
    _configureDio();
    try {
      Response response = await _dio.get(
        '/posts',
        queryParameters: {'categories': 6248, 'page': page},
      );

      List<ArticlesSuccessSchema> articles = (response.data as List)
          .map((i) => ArticlesSuccessSchema.fromJson(i))
          .toList();

      return Either.right(articles);
    } on DioException catch (ex) {
      return Either.left(_statusErrorHandler(ex.response));
    }
  }
}
