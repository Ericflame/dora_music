// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singers_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingersDetails _$SingersDetailsFromJson(Map<String, dynamic> json) =>
    SingersDetails()
      ..name = json['name'] as String?
      ..img1v1Id = json['img1v1Id'] as int?
      ..id = json['id'] as int?
      ..picUrl = json['picUrl'] as String?
      ..briefDesc = json['briefDesc'] as String?
      ..musicSize = json['musicSize'] as int?;

Map<String, dynamic> _$SingersDetailsToJson(SingersDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'img1v1Id': instance.img1v1Id,
      'id': instance.id,
      'picUrl': instance.picUrl,
      'briefDesc': instance.briefDesc,
      'musicSize': instance.musicSize,
    };
