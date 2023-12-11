import 'dart:io';

import 'package:dio/dio.dart';
import 'package:iam_back/core/constants/constants.dart';
import 'package:iam_back/core/resources/data_state.dart';
import 'package:iam_back/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:iam_back/features/daily_news/domain/entities/article.dart';
import 'package:iam_back/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      print('!!!');
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );
      print('111');

      print('httpResponse $httpResponse');

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print('http response ${httpResponse.response} ${httpResponse.data}');
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      print("E $e");
      return DataFailed(e);
    }
  }
}
