import 'package:json_annotation/json_annotation.dart';
part 'url_info.g.dart';

@JsonSerializable()
class UrlInfo {
  String? id;
  String? url;

  UrlInfo();
  factory UrlInfo.fromJson(Map<String, dynamic> srcJson) => _$UrlInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UrlInfoToJson(this);
}


