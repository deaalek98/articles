import 'package:articles/src/features/articles_main/articles_main/domain/entities/media_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ArticleModel {
  ArticleModel(
      {required this.id,
      required this.url,
      required this.section,
      required this.adxKeywords,
      required this.title,
      required this.media,
      required this.updated,
      required this.abstract});

  late final int id;
  final String? url;
  final String? section;
  final String? adxKeywords;
  final String? updated;
  final String? title;
  final List<MediaModel>? media;
  final String? abstract;

  factory ArticleModel.fromJson(json) => _$ArticleModelFromJson(json);

  toJson() => _$ArticleModelToJson(this);
}
