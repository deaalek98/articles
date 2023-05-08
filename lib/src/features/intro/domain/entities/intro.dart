import 'package:json_annotation/json_annotation.dart';

part 'intro.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class IntroEntity {
  final String currentAndroid;
  final String acceptAndroid;
  final String currentIos;
  final String acceptIos;
  final bool? autoUpdate;

  IntroEntity(
      {required this.currentAndroid, required this.acceptAndroid, required this.currentIos, required this.acceptIos, required this.autoUpdate});

  factory IntroEntity.fromJson(json) => _$IntroEntityFromJson(json);

  toJson() => _$IntroEntityToJson(this);

  static List<IntroEntity> fromJsonList(List json) {
    return json.map((e) => IntroEntity.fromJson(e)).toList();
  }
}
