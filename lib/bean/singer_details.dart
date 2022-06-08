import 'package:json_annotation/json_annotation.dart';
part 'singer_details.g.dart';

@JsonSerializable()
class SingerDetails {
  String? ti;
  String? txt;


  SingerDetails();
  factory SingerDetails.fromJson(Map<String, dynamic> srcJson) => _$SingerDetailsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SingerDetailsToJson(this);
}


