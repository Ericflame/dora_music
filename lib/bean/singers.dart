import 'package:json_annotation/json_annotation.dart';
part 'singers.g.dart';

@JsonSerializable()
class Singers {
  String ? name;
  int ? id;

  Singers();
  factory Singers.fromJson(Map<String, dynamic> srcJson) => _$SingersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SingersToJson(this);
}


