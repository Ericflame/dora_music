import 'package:json_annotation/json_annotation.dart';
part 'group.g.dart';

@JsonSerializable()
class Group {
  String ? name;

  Group();
  factory Group.fromJson(Map<String, dynamic> srcJson) => _$GroupFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}


