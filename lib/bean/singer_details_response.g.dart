// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singer_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingerDetailResponse<T> _$SingerDetailResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    SingerDetailResponse<T>()
      ..code = json['code'] as int?
      ..introduction =
          _$nullableGenericFromJson(json['introduction'], fromJsonT);

Map<String, dynamic> _$SingerDetailResponseToJson<T>(
  SingerDetailResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'introduction': _$nullableGenericToJson(instance.introduction, toJsonT),
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
