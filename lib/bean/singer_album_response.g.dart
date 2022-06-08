// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singer_album_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingerAlbumResponse<T> _$SingerAlbumResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    SingerAlbumResponse<T>()
      ..code = json['code'] as int?
      ..hotAlbums = _$nullableGenericFromJson(json['hotAlbums'], fromJsonT)
      ..more = json['more'] as bool?;

Map<String, dynamic> _$SingerAlbumResponseToJson<T>(
  SingerAlbumResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'hotAlbums': _$nullableGenericToJson(instance.hotAlbums, toJsonT),
      'more': instance.more,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
