import 'package:flutter_advanced/bean/suggest_video_detail.dart';
import 'package:json_annotation/json_annotation.dart';
part 'suggest_video.g.dart';

@JsonSerializable()
class SuggestVideo {
  bool? displayed;
  SuggestVideoDetail? data;

  SuggestVideo();
  factory SuggestVideo.fromJson(Map<String, dynamic> srcJson) => _$SuggestVideoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SuggestVideoToJson(this);
}


