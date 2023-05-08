// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaDataModel _$MetaDataModelFromJson(Map<String, dynamic> json) =>
    MetaDataModel(
      url: json['url'] as String?,
      format: json['format'] as String?,
      height: (json['height'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MetaDataModelToJson(MetaDataModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'format': instance.format,
      'height': instance.height,
      'width': instance.width,
    };
