import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_arch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_arch/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_arch/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_arch/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_arch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {

  //Dio (singleton method)
  s1.registerSingleton<Dio>(Dio());

  // Dependencies (singleton method)
  s1.registerSingleton<NewsApiService>(NewsApiService(s1()));

  s1.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(s1())
  );

  //use case (singleton method)
  s1.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(s1())
  );

  //BLoCs (factory method)
  s1.registerFactory<RemoteArticleBloc>(
          () => RemoteArticleBloc(s1())
  );
}