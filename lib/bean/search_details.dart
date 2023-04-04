import 'package:dora_music/bean/search_album.dart';
import 'package:dora_music/bean/search_artists.dart';
import 'package:dora_music/bean/search_details_songs.dart';
import 'package:dora_music/bean/search_dj.dart';
import 'package:dora_music/bean/search_play_lists.dart';
import 'package:dora_music/bean/search_users.dart';
import 'package:dora_music/bean/search_videos.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_details.g.dart';

@JsonSerializable()
class SearchDetails {
  bool? hasMore;
  int? songCount;
  List<SearchDetailsSongs>? songs;
  List<SearchArtists> ? artists;
  List<SearchVideos> ? videos;
  List<SearchAlbum> ? albums;
  List<SearchPlayLists> ? playlists;
  List<SearchDj> ? dj;
  List<SearchUsers> ? userprofiles;
  SearchDetails();
  factory SearchDetails.fromJson(Map<String, dynamic> srcJson) => _$SearchDetailsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchDetailsToJson(this);
}


