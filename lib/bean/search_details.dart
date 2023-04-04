import 'package:dora_music/bean/search_artists.dart';
import 'package:dora_music/bean/search_details_songs.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_details.g.dart';

@JsonSerializable()
class SearchDetails {
  bool? hasMore;
  int? songCount;
  List<SearchDetailsSongs>? songs;
  List<SearchArtists> ? artists;
  SearchDetails();
  factory SearchDetails.fromJson(Map<String, dynamic> srcJson) => _$SearchDetailsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchDetailsToJson(this);
}


