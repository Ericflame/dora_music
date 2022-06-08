import 'package:json_annotation/json_annotation.dart';
part 'mv_top.g.dart';

@JsonSerializable()
class MvTop {
  int? id;
  String? cover;
  String? name;
  int? playCount;
  // String? briefDesc;
  // String? desc;
  String? artistName;
  // String? artistId;
  // String? duration;
  // String? mark;
  MvTop();
  factory MvTop.fromJson(Map<String, dynamic> srcJson) => _$MvTopFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MvTopToJson(this);
}


