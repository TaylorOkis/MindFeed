import 'package:mind_feed/core/resources/data_state.dart';
import 'package:mind_feed/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
