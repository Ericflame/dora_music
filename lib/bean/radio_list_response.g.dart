// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadioListResponse<T> _$RadioListResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    RadioListResponse<T>()
      ..code = json['code'] as int?
      ..result = _$nullableGenericFromJson(json['result'], fromJsonT)
      ..category = json['category'] as int?;

Map<String, dynamic> _$RadioListResponseToJson<T>(
  RadioListResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'result': _$nullableGenericToJson(instance.result, toJsonT),
      'category': instance.category,
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
