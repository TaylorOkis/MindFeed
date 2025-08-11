import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/article.dart';

part 'article_model.g.dart';

@HiveType(typeId: 0)
class ArticleModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String? author;

  @HiveField(2)
  final String? title;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final String? urlImage;

  @HiveField(5)
  final String? urlToImage;

  @HiveField(6)
  final String? publishedAt;

  @HiveField(7)
  final String? content;

  ArticleModel({
    required this.id,
    this.author,
    this.title,
    this.description,
    this.urlImage,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  // API -> Model
  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      id: Uuid().v4(),
      author: map["author"] ?? "",
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      urlImage: map['urlImage'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
    );
  }

  // Model -> API
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

  // Model -> Domain
  ArticleEntity toEntity() => ArticleEntity(
    id: id,
    author: author,
    title: title,
    description: description,
    urlImage: urlImage,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
    content: content,
  );

  // Domain -> Model
  factory ArticleModel.fromEntity(ArticleEntity entity) => ArticleModel(
    id: entity.id,
    author: entity.author,
    title: entity.title,
    description: entity.description,
    urlImage: entity.urlImage,
    urlToImage: entity.urlToImage,
    publishedAt: entity.publishedAt,
    content: entity.content,
  );
}
