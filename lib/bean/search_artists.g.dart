// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_artists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchArtists _$SearchArtistsFromJson(Map<String, dynamic> json) =>
    SearchArtists()
      ..name = json['name'] as String?
      ..picUrl = json['picUrl'] as String?
      ..albumSize = json['albumSize'] as int?
      ..mvSize = json['mvSize'] as int?;

Map<String, dynamic> _$SearchArtistsToJson(SearchArtists instance) =>
    <String, dynamic>{
      'name': instance.name,
      'picUrl': instance.picUrl,
      'albumSize': instance.albumSize,
      'mvSize': instance.mvSize,
    };
