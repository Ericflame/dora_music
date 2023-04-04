import 'package:dora_music/bean/search_album.dart';
import 'package:dora_music/bean/search_artists.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_details_songs.g.dart';

@JsonSerializable()
class SearchDetailsSongs {
  int? id;
  String? name;
  List<SearchArtists> ? artists;
  SearchAlbum ? album;

  SearchDetailsSongs();
  factory SearchDetailsSongs.fromJson(Map<String, dynamic> srcJson) => _$SearchDetailsSongsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchDetailsSongsToJson(this);
}


