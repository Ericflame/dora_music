import 'package:flutter_advanced/bean/play_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'singers_list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class SingersListResponse<T> {
   int? code;
   T? artists;
   bool? more;
   SingersListResponse();
   factory SingersListResponse.fromJson(Map<String, dynamic> json,T Function(dynamic json) fromJsonT,) =>
       _$SingersListResponseFromJson(json, fromJsonT);

   Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
       _$SingersListResponseToJson(this, toJsonT);
}