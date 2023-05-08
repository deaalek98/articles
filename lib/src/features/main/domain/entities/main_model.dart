import 'package:json_annotation/json_annotation.dart';
part 'main_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MainModel {
MainModel({
    required this.id,
    required this.name
  });
  late final int id;
  late final String name;

  factory MainModel.fromJson(json) => _$MainModelFromJson(json);

  toJson() => _$MainModelToJson(this);
}