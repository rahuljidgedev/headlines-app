import 'package:equatable/equatable.dart';
import 'package:news_arch/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleEvent extends Equatable{
  final ArticleEntity ? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSavedArticles extends LocalArticleEvent {
  const GetSavedArticles();
}

class RemoveArticles extends LocalArticleEvent {
  const RemoveArticles(ArticleEntity article): super(article: article);
}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle(ArticleEntity article): super(article: article);
}