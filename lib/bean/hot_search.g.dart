// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotSearch _$HotSearchFromJson(Map<String, dynamic> json) => HotSearch()
  ..content = json['content'] as String?
  ..iconUrl = json['iconUrl'] as String?
  ..searchWord = json['searchWord'] as String?;

Map<String, dynamic> _$HotSearchToJson(HotSearch instance) => <String, dynamic>{
      'content': instance.content,
      'iconUrl': instance.iconUrl,
      'searchWord': instance.searchWord,
    };
