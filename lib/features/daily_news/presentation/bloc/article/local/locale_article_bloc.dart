  import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_arch/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_arch/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_arch/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_arch/features/daily_news/presentation/bloc/article/local/locale_article_state.dart';

import 'local_article_event.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent,LocalArticleState>{
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _savedArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
      this._getSavedArticleUseCase,
      this._savedArticleUseCase,
      this._removeArticleUseCase
      ): super(const LocalArticlesLoading()){
    on <GetSavedArticles>(onGetSavedArticles);
    on <RemoveArticles>(onRemoveArticles);
    on <SaveArticle>(onSaveArticles);
  }

  void onGetSavedArticles(GetSavedArticles event,Emitter<LocalArticleState> emit) async {
    final article = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(article));
  }

  void onRemoveArticles(RemoveArticles removeArticles,Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: removeArticles.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticles(SaveArticle saveArticles,Emitter<LocalArticleState> emit) async {
    await _savedArticleUseCase(params: saveArticles.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

}