// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchAlbum _$SearchAlbumFromJson(Map<String, dynamic> json) => SearchAlbum()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..url = json['url'] as String?
  ..artists = (json['artists'] as List<dynamic>?)
      ?.map((e) => SearchArtists.fromJson(e as Map<String, dynamic>))
      .toList()
  ..artist = json['artist'] == null
      ? null
      : SearchArtists.fromJson(json['artist'] as Map<String, dynamic>)
  ..publishTime = json['publishTime'] as int?;

Map<String, dynamic> _$SearchAlbumToJson(SearchAlbum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'artists': instance.artists,
      'artist': instance.artist,
      'publishTime': instance.publishTime,
    };
