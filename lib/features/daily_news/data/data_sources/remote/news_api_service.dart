import 'package:dio/dio.dart';
import 'package:iam_back/core/constants/constants.dart';
import 'package:iam_back/features/daily_news/data/models/article.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
