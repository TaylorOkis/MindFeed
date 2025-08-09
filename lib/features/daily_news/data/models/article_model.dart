import 'package:mind_feed/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? urlImage,
    String? urlToImage,
    String? publishedAt,
    String? content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map["author"] ?? "",
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      urlImage: map['urlImage'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "author": author,
      "title": title,
      "description": description,
      "urlImage": urlImage,
      "urlToImage": urlToImage,
      "publishedAt": publishedAt,
      "content": content,
    };
  }
}
