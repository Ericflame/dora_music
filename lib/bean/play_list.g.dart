// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayList _$PlayListFromJson(Map<String, dynamic> json) => PlayList()
  ..description = json['description'] as String?
  ..name = json['name'] as String?
  ..id = json['id'] as int?
  ..coverImgUrl = json['coverImgUrl'] as String?
  ..signature = json['signature'] as String?;

Map<String, dynamic> _$PlayListToJson(PlayList instance) => <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'id': instance.id,
      'coverImgUrl': instance.coverImgUrl,
      'signature': instance.signature,
    };
