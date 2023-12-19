import 'package:news_arch/core/usecases/usecase.dart';
import 'package:news_arch/features/daily_news/domain/entities/article.dart';
import 'package:news_arch/features/daily_news/domain/repository/article_repository.dart';

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {

  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);
  @override
  Future<void> call({ArticleEntity ? params}) {
    return _articleRepository.saveArticle(params!);
  }
}