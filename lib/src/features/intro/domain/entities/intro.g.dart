// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntroEntity _$IntroEntityFromJson(Map<String, dynamic> json) => IntroEntity(
      currentAndroid: json['current_android'] as String,
      acceptAndroid: json['accept_android'] as String,
      currentIos: json['current_ios'] as String,
      acceptIos: json['accept_ios'] as String,
      autoUpdate: json['auto_update'] as bool?,
    );

Map<String, dynamic> _$IntroEntityToJson(IntroEntity instance) =>
    <String, dynamic>{
      'current_android': instance.currentAndroid,
      'accept_android': instance.acceptAndroid,
      'current_ios': instance.currentIos,
      'accept_ios': instance.acceptIos,
      'auto_update': instance.autoUpdate,
    };
