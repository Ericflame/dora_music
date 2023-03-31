import 'package:json_annotation/json_annotation.dart';
part 'creator.g.dart';

@JsonSerializable()
class Creator {
  String ? nickname;

  Creator();
  factory Creator.fromJson(Map<String, dynamic> srcJson) => _$CreatorFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CreatorToJson(this);
}


