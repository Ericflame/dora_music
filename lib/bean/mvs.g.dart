// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mvs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mvs _$MvsFromJson(Map<String, dynamic> json) => Mvs()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..playCount = json['playCount'] as int?
  ..imgurl16v9 = json['imgurl16v9'] as String?
  ..publishTime = json['publishTime'] as String?
  ..artistName = json['artistName'] as String?;

Map<String, dynamic> _$MvsToJson(Mvs instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'playCount': instance.playCount,
      'imgurl16v9': instance.imgurl16v9,
      'publishTime': instance.publishTime,
      'artistName': instance.artistName,
    };
