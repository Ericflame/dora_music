// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_suggest_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSuggestList _$SearchSuggestListFromJson(Map<String, dynamic> json) =>
    SearchSuggestList()
      ..keyword = json['keyword'] as String?
      ..type = json['type'] as int?;

Map<String, dynamic> _$SearchSuggestListToJson(SearchSuggestList instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'type': instance.type,
    };
