import 'package:mind_feed/core/usecases/usecase.dart';
import 'package:mind_feed/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/article.dart';

class GetArticleUseCase
    implements Usecase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
