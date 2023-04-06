// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_play_lists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPlayLists _$SearchPlayListsFromJson(Map<String, dynamic> json) =>
    SearchPlayLists()
      ..id = json['id'] as int?
      ..name = json['name'] as String?
      ..creator = json['creator'] == null
          ? null
          : Creator.fromJson(json['creator'] as Map<String, dynamic>)
      ..trackCount = json['trackCount'] as int?
      ..playCount = json['playCount'] as int?;

Map<String, dynamic> _$SearchPlayListsToJson(SearchPlayLists instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'creator': instance.creator,
      'trackCount': instance.trackCount,
      'playCount': instance.playCount,
    };
