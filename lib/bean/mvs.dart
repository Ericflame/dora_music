import 'package:json_annotation/json_annotation.dart';
part 'mvs.g.dart';

@JsonSerializable()
class Mvs {
  int? id;
  String? name;
  int? playCount;
  String? imgurl16v9;
  String? publishTime;
  String? artistName;
  Mvs();
  factory Mvs.fromJson(Map<String, dynamic> srcJson) => _$MvsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MvsToJson(this);
}


