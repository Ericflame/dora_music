// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchUsers _$SearchUsersFromJson(Map<String, dynamic> json) => SearchUsers()
  ..nickname = json['nickname'] as String?
  ..url = json['url'] as String?
  ..signature = json['signature'] as String?;

Map<String, dynamic> _$SearchUsersToJson(SearchUsers instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'url': instance.url,
      'signature': instance.signature,
    };
