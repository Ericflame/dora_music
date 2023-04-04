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
      ..title = json['title'] as String?
      ..shareCount = json['shareCount'] as int?
      ..commentCount = json['commentCount'] as int?
      ..praisedCount = json['praisedCount'] as int?
      ..creator = json['creator'] == null
          ? null
          : Creator.fromJson(json['creator'] as Map<String, dynamic>)
      ..videoGroup = (json['videoGroup'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SuggestVideoDetailToJson(SuggestVideoDetail instance) =>
    <String, dynamic>{
      'urlInfo': instance.urlInfo,
      'title': instance.title,
      'shareCount': instance.shareCount,
      'commentCount': instance.commentCount,
      'praisedCount': instance.praisedCount,
      'creator': instance.creator,
      'videoGroup': instance.videoGroup,
    };
