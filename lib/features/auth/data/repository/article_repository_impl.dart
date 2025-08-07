import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mind_feed/features/auth/data/data_sources/remote/news_api_service.dart';
import 'package:mind_feed/features/auth/domain/repository/article_repository.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/resources/data_state.dart';
import '../models/article_model.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
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
