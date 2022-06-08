import 'package:json_annotation/json_annotation.dart';
part 'radio_list.g.dart';

@JsonSerializable()
class RadioList {
  String? copywriter;
  String? name;
  int? id;
  String? picUrl;
  RadioList();
  factory RadioList.fromJson(Map<String, dynamic> srcJson) => _$RadioListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RadioListToJson(this);
}


