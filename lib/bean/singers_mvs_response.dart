import 'package:dora_music/bean/play_list.dart';
import 'package:json_annotation/json_annotation.dart';

import 'hot_song.dart';
import 'mvs.dart';

part 'singers_mvs_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class SingersMvResponse<T> {
   T? mvs;
   SingersMvResponse();

   factory SingersMvResponse.fromJson(Map<String, dynamic> json,T Function(dynamic json) fromJsonT,) =>
       _$SingersMvResponseFromJson(json, fromJsonT);

   Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
       _$SingersMvResponseToJson(this, toJsonT);
}