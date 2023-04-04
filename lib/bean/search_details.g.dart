// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchDetails _$SearchDetailsFromJson(Map<String, dynamic> json) =>
    SearchDetails()
      ..hasMore = json['hasMore'] as bool?
      ..songCount = json['songCount'] as int?
      ..songs = (json['songs'] as List<dynamic>?)
          ?.map((e) => SearchDetailsSongs.fromJson(e as Map<String, dynamic>))
          .toList()
      ..artists = (json['artists'] as List<dynamic>?)
          ?.map((e) => SearchArtists.fromJson(e as Map<String, dynamic>))
          .toList()
      ..videos = (json['videos'] as List<dynamic>?)
          ?.map((e) => SearchVideos.fromJson(e as Map<String, dynamic>))
          .toList()
      ..albums = (json['albums'] as List<dynamic>?)
          ?.map((e) => SearchAlbum.fromJson(e as Map<String, dynamic>))
          .toList()
      ..playlists = (json['playlists'] as List<dynamic>?)
          ?.map((e) => SearchPlayLists.fromJson(e as Map<String, dynamic>))
          .toList()
      ..dj = (json['dj'] as List<dynamic>?)
          ?.map((e) => SearchDj.fromJson(e as Map<String, dynamic>))
          .toList()
      ..userprofiles = (json['userprofiles'] as List<dynamic>?)
          ?.map((e) => SearchUsers.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SearchDetailsToJson(SearchDetails instance) =>
    <String, dynamic>{
      'hasMore': instance.hasMore,
      'songCount': instance.songCount,
      'songs': instance.songs,
      'artists': instance.artists,
      'videos': instance.videos,
      'albums': instance.albums,
      'playlists': instance.playlists,
      'dj': instance.dj,
      'userprofiles': instance.userprofiles,
    };
