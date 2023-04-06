// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_songs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSongs _$SearchSongsFromJson(Map<String, dynamic> json) => SearchSongs()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..artists = (json['artists'] as List<dynamic>?)
      ?.map((e) => SearchArtists.fromJson(e as Map<String, dynamic>))
      .toList()
  ..album = json['album'] == null
      ? null
      : SearchAlbum.fromJson(json['album'] as Map<String, dynamic>);

Map<String, dynamic> _$SearchSongsToJson(SearchSongs instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artists': instance.artists,
      'album': instance.album,
    };
