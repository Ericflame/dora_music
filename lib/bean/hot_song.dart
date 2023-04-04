import 'package:dora_music/bean/singers.dart';
import 'package:dora_music/bean/songs_details.dart';
import 'package:json_annotation/json_annotation.dart';
part 'hot_song.g.dart';

@JsonSerializable()
class HotSong {
  String ? name;
  int ? id;
  List<Singers> ? ar;
  SongsDetails ? al;
  HotSong();
  factory HotSong.fromJson(Map<String, dynamic> srcJson) => _$HotSongFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HotSongToJson(this);
}


