import 'package:iam_back/core/resources/data_state.dart';
import 'package:iam_back/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
