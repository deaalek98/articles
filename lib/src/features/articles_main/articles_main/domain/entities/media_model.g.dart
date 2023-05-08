// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaModel _$MediaModelFromJson(Map<String, dynamic> json) => MediaModel(
      type: json['type'] as String?,
      metadataList: (json['media-metadata'] as List<dynamic>?)
          ?.map(MetaDataModel.fromJson)
          .toList(),
    );

Map<String, dynamic> _$MediaModelToJson(MediaModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'media-metadata': instance.metadataList,
    };
