import 'package:flutter_advanced/bean/play_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'radio_list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class RadioListResponse<T> {
   int? code;
   T? result;
   int? category;
   RadioListResponse();
   factory RadioListResponse.fromJson(Map<String, dynamic> json,T Function(dynamic json) fromJsonT,) =>
       _$RadioListResponseFromJson(json, fromJsonT);

   Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
       _$RadioListResponseToJson(this, toJsonT);
}