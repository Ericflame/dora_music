import 'package:dora_music/bean/play_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'singer_details_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class SingerDetailResponse<T> {
   int? code;
   T? introduction;
   SingerDetailResponse();
   factory SingerDetailResponse.fromJson(Map<String, dynamic> json,T Function(dynamic json) fromJsonT,) =>
       _$SingerDetailResponseFromJson(json, fromJsonT);

   Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
       _$SingerDetailResponseToJson(this, toJsonT);
}