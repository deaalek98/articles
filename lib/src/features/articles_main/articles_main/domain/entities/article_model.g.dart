// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      id: json['id'] as int,
      url: json['url'] as String?,
      section: json['section'] as String?,
      adxKeywords: json['adx_keywords'] as String?,
      title: json['title'] as String?,
      media:
          (json['media'] as List<dynamic>?)?.map(MediaModel.fromJson).toList(),
      abstract: json['abstract'] as String?,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'section': instance.section,
      'adx_keywords': instance.adxKeywords,
      'title': instance.title,
      'media': instance.media,
      'abstract': instance.abstract,
    };
