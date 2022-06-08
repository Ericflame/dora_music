// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singers_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingersDetailResponse<T> _$SingersDetailResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    SingersDetailResponse<T>()
      ..code = json['code'] as int?
      ..artist = _$nullableGenericFromJson(json['artist'], fromJsonT)
      ..more = json['more'] as bool?
      ..hotSongs = (json['hotSongs'] as List<dynamic>?)
          ?.map((e) => HotSong.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SingersDetailResponseToJson<T>(
  SingersDetailResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'artist': _$nullableGenericToJson(instance.artist, toJsonT),
      'more': instance.more,
      'hotSongs': instance.hotSongs,
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
