import 'package:json_annotation/json_annotation.dart';
part 'search_album.g.dart';

@JsonSerializable()
class SearchAlbum {
  int? id;
  String? name;

  SearchAlbum();
  factory SearchAlbum.fromJson(Map<String, dynamic> srcJson) => _$SearchAlbumFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchAlbumToJson(this);
}


