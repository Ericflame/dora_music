// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_details_songs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchDetailsSongs _$SearchDetailsSongsFromJson(Map<String, dynamic> json) =>
    SearchDetailsSongs()
      ..id = json['id'] as int?
      ..name = json['name'] as String?
      ..artists = (json['artists'] as List<dynamic>?)
          ?.map((e) => SearchArtists.fromJson(e as Map<String, dynamic>))
          .toList()
      ..album = json['album'] == null
          ? null
          : SearchAlbum.fromJson(json['album'] as Map<String, dynamic>);

Map<String, dynamic> _$SearchDetailsSongsToJson(SearchDetailsSongs instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artists': instance.artists,
      'album': instance.album,
    };
