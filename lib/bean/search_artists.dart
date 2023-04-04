import 'package:json_annotation/json_annotation.dart';
part 'search_artists.g.dart';

@JsonSerializable()
class SearchArtists {
  String? name;
  String? picUrl;
  int ? albumSize;
  int ? mvSize;
  SearchArtists();
  factory SearchArtists.fromJson(Map<String, dynamic> srcJson) => _$SearchArtistsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchArtistsToJson(this);
}


