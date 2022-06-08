// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singer_hot_album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingerHotAlbum _$SingerHotAlbumFromJson(Map<String, dynamic> json) =>
    SingerHotAlbum()
      ..name = json['name'] as String?
      ..id = json['id'] as int?
      ..blurPicUrl = json['blurPicUrl'] as String?
      ..publishTime = json['publishTime'] as int?
      ..size = json['size'] as int?;

Map<String, dynamic> _$SingerHotAlbumToJson(SingerHotAlbum instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'blurPicUrl': instance.blurPicUrl,
      'publishTime': instance.publishTime,
      'size': instance.size,
    };
