import 'package:dio/dio.dart';
import 'package:news_arch/core/constants/constants.dart';
import 'package:news_arch/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';


@RestApi(baseUrl:newAPIBaseURL)
abstract class NewsApiService{
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNesArticles({
   @Query("apiKey") String ? apiKey,
   @Query("country") String ? country,
   @Query("category") String ? category,
  });

}