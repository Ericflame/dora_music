// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_video_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestVideoDetail _$SuggestVideoDetailFromJson(Map<String, dynamic> json) =>
    SuggestVideoDetail()
      ..urlInfo = json['urlInfo'] == null
          ? null
          : UrlInfo.fromJson(json['urlInfo'] as Map<String, dynamic>)
      ..title = json['title'] as String?;

Map<String, dynamic> _$SuggestVideoDetailToJson(SuggestVideoDetail instance) =>
    <String, dynamic>{
      'urlInfo': instance.urlInfo,
      'title': instance.title,
    };
