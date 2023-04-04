import 'package:flutter_advanced/bean/url_info.dart';
import 'package:json_annotation/json_annotation.dart';

import 'creator.dart';
import 'group.dart';
part 'suggest_video_detail.g.dart';

@JsonSerializable()
class SuggestVideoDetail {
  UrlInfo? urlInfo;
  String ? title;
  int ? shareCount;
  int ? commentCount;
  int ? praisedCount;
  Creator ? creator;
  List<Group> ? videoGroup;
  SuggestVideoDetail();
  factory SuggestVideoDetail.fromJson(Map<String, dynamic> srcJson) => _$SuggestVideoDetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SuggestVideoDetailToJson(this);
}


