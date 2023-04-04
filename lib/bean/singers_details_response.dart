import 'package:dora_music/bean/play_list.dart';
import 'package:json_annotation/json_annotation.dart';

import 'hot_song.dart';

part 'singers_details_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class SingersDetailResponse<T> {
   int? code;
   T? artist;
   bool? more;
   List<HotSong>? hotSongs;
   SingersDetailResponse();
   factory SingersDetailResponse.fromJson(Map<String, dynamic> json,T Function(dynamic json) fromJsonT,) =>
       _$SingersDetailResponseFromJson(json, fromJsonT);

   Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
       _$SingersDetailResponseToJson(this, toJsonT);
}