import 'package:json_annotation/json_annotation.dart';
part 'play_list.g.dart';

@JsonSerializable()
class PlayList {
  String? description;
  String? name;
  int? id;
  String? coverImgUrl;
  String? signature;
  PlayList();
  factory PlayList.fromJson(Map<String, dynamic> srcJson) => _$PlayListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PlayListToJson(this);
}


