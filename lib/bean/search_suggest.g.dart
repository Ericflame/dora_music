// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_suggest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSuggest _$SearchSuggestFromJson(Map<String, dynamic> json) =>
    SearchSuggest()
      ..allMatch = (json['allMatch'] as List<dynamic>?)
          ?.map((e) => SearchSuggestList.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SearchSuggestToJson(SearchSuggest instance) =>
    <String, dynamic>{
      'allMatch': instance.allMatch,
    };
