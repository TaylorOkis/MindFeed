import 'package:mind_feed/core/resources/data_state.dart';
import 'package:mind_feed/features/auth/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
