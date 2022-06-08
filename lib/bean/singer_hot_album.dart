import 'package:json_annotation/json_annotation.dart';
part 'singer_hot_album.g.dart';

@JsonSerializable()
class SingerHotAlbum {
  String? name;
  int? id;
  String? blurPicUrl;
  int? publishTime;
  int? size;
  SingerHotAlbum();
  factory SingerHotAlbum.fromJson(Map<String, dynamic> srcJson) => _$SingerHotAlbumFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SingerHotAlbumToJson(this);
}


