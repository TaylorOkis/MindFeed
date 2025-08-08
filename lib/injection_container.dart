import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/domain/usecases/get_article.dart';
import 'features/auth/data/repository/article_repository_impl.dart';
import 'features/auth/domain/repository/article_repository.dart';
import 'features/auth/data/data_sources/remote/news_api_service.dart';
import 'features/auth/presentation/controller/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
