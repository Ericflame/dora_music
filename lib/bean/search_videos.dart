import 'package:json_annotation/json_annotation.dart';

import 'users.dart';

part 'search_videos.g.dart';

@JsonSerializable()
class SearchVideos {
  String? url;
  String? title;
  int? playTime;
  int? durationms;
  List<Users> ? creator;
  SearchVideos();
  factory SearchVideos.fromJson(Map<String, dynamic> srcJson) => _$SearchVideosFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchVideosToJson(this);
}


