import 'package:articles/src/features/articles_main/articles_main/domain/entities/meta_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MediaModel {
  MediaModel({required this.type, required this.metadataList});

  final String? type;
  @JsonKey(name: "media-metadata")
  final List<MetaDataModel>? metadataList;

  factory MediaModel.fromJson(json) => _$MediaModelFromJson(json);

  toJson() => _$MediaModelToJson(this);
}
