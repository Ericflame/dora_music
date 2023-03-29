// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response_s.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponseS<T> _$CommonResponseSFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    CommonResponseS<T>()
      ..datas = _$nullableGenericFromJson(json['datas'], fromJsonT);

Map<String, dynamic> _$CommonResponseSToJson<T>(
  CommonResponseS<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'datas': _$nullableGenericToJson(instance.datas, toJsonT),
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
