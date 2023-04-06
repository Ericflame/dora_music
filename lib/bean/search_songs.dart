import 'package:dora_music/bean/search_album.dart';
import 'package:dora_music/bean/search_artists.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_songs.g.dart';

@JsonSerializable()
class SearchSongs {
  int? id;
  String? name;
  List<SearchArtists> ? artists;
  SearchAlbum ? album;

  SearchSongs();
  factory SearchSongs.fromJson(Map<String, dynamic> srcJson) => _$SearchSongsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchSongsToJson(this);
}


