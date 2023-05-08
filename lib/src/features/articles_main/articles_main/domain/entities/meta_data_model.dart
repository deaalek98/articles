import 'package:json_annotation/json_annotation.dart';

part 'meta_data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MetaDataModel {
  MetaDataModel(
      {required this.url,
      required this.format,
      required this.height,
      required this.width});

  final String? url;
  final String? format;
  final double? height;
  final double? width;

  factory MetaDataModel.fromJson(json) => _$MetaDataModelFromJson(json);

  toJson() => _$MetaDataModelToJson(this);
}
