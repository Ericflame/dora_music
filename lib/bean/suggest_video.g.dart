// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestVideo _$SuggestVideoFromJson(Map<String, dynamic> json) => SuggestVideo()
  ..displayed = json['displayed'] as bool?
  ..data = json['data'] == null
      ? null
      : SuggestVideoDetail.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$SuggestVideoToJson(SuggestVideo instance) =>
    <String, dynamic>{
      'displayed': instance.displayed,
      'data': instance.data,
    };
