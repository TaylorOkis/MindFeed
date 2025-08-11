import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mind_feed/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:mind_feed/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/article.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final entities = httpResponse.data.map((m) => m.toEntity()).toList();
        return DataSuccess(entities);
      } else {
        return DataFailure(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (error) {
      return DataFailure(error);
    }
  }
}
