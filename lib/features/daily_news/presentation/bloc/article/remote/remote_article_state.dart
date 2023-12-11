import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:iam_back/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles!, error!];
}

class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone(List<ArticleEntity> article) : super(articles: article);
}

class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioException error) : super(error: error);
}
