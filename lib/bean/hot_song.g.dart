// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotSong _$HotSongFromJson(Map<String, dynamic> json) => HotSong()
  ..name = json['name'] as String?
  ..id = json['id'] as int?
  ..ar = (json['ar'] as List<dynamic>?)
      ?.map((e) => Singers.fromJson(e as Map<String, dynamic>))
      .toList()
  ..al = json['al'] == null
      ? null
      : SongsDetails.fromJson(json['al'] as Map<String, dynamic>);

Map<String, dynamic> _$HotSongToJson(HotSong instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'ar': instance.ar,
      'al': instance.al,
    };
