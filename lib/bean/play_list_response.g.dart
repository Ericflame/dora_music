// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayListResponse<T> _$PlayListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PlayListResponse<T>()
      ..code = json['code'] as int?
      ..playlists = _$nullableGenericFromJson(json['playlists'], fromJsonT)
      ..total = json['total'] as int?;

Map<String, dynamic> _$PlayListResponseToJson<T>(
  PlayListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'playlists': _$nullableGenericToJson(instance.playlists, toJsonT),
      'total': instance.total,
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
