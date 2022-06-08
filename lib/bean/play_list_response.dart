import 'package:flutter_advanced/bean/play_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'play_list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PlayListResponse<T> {
   int? code;
   T? playlists;
   int? total;
   PlayListResponse();
   factory PlayListResponse.fromJson(Map<String, dynamic> json,T Function(dynamic json) fromJsonT,) =>
       _$PlayListResponseFromJson(json, fromJsonT);

   Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
       _$PlayListResponseToJson(this, toJsonT);
}