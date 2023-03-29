import 'package:json_annotation/json_annotation.dart';

part 'common_response_s.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CommonResponseS<T> {
   T? datas;
   CommonResponseS();
   factory CommonResponseS.fromJson(Map<String, dynamic> json,T Function(dynamic json) fromJsonT,) =>
       _$CommonResponseSFromJson(json, fromJsonT);

   Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
       _$CommonResponseSToJson(this, toJsonT);
}