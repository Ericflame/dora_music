import 'package:json_annotation/json_annotation.dart';
part 'singers_list.g.dart';

@JsonSerializable()
class SingersList {
  String? name;
  int? id;
  String? img1v1Url;
  SingersList();
  factory SingersList.fromJson(Map<String, dynamic> srcJson) => _$SingersListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SingersListToJson(this);
}


