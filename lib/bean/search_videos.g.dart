// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchVideos _$SearchVideosFromJson(Map<String, dynamic> json) => SearchVideos()
  ..url = json['url'] as String?
  ..title = json['title'] as String?
  ..playTime = json['playTime'] as int?
  ..durationms = json['durationms'] as int?
  ..creator = (json['creator'] as List<dynamic>?)
      ?.map((e) => Users.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$SearchVideosToJson(SearchVideos instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'playTime': instance.playTime,
      'durationms': instance.durationms,
      'creator': instance.creator,
    };
