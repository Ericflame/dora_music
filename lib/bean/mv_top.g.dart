// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mv_top.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MvTop _$MvTopFromJson(Map<String, dynamic> json) => MvTop()
  ..id = json['id'] as int?
  ..cover = json['cover'] as String?
  ..name = json['name'] as String?
  ..playCount = json['playCount'] as int?
  ..artistName = json['artistName'] as String?;

Map<String, dynamic> _$MvTopToJson(MvTop instance) => <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'name': instance.name,
      'playCount': instance.playCount,
      'artistName': instance.artistName,
    };
