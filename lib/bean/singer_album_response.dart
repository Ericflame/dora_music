import 'package:json_annotation/json_annotation.dart';

part 'singer_album_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class SingerAlbumResponse<T> {
   int? code;
   T? hotAlbums;
   bool? more;
   SingerAlbumResponse();
   factory SingerAlbumResponse.fromJson(Map<String, dynamic> json,T Function(dynamic json) fromJsonT,) =>
       _$SingerAlbumResponseFromJson(json, fromJsonT);

   Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
       _$SingerAlbumResponseToJson(this, toJsonT);
}