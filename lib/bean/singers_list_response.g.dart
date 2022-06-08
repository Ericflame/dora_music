// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singers_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingersListResponse<T> _$SingersListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    SingersListResponse<T>()
      ..code = json['code'] as int?
      ..artists = _$nullableGenericFromJson(json['artists'], fromJsonT)
      ..more = json['more'] as bool?;

Map<String, dynamic> _$SingersListResponseToJson<T>(
  SingersListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'artists': _$nullableGenericToJson(instance.artists, toJsonT),
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
