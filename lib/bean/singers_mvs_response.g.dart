// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singers_mvs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingersMvResponse<T> _$SingersMvResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    SingersMvResponse<T>()
      ..mvs = _$nullableGenericFromJson(json['mvs'], fromJsonT);

Map<String, dynamic> _$SingersMvResponseToJson<T>(
  SingersMvResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'mvs': _$nullableGenericToJson(instance.mvs, toJsonT),
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
