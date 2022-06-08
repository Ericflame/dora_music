import 'package:json_annotation/json_annotation.dart';
part 'singers_details.g.dart';

@JsonSerializable()
class SingersDetails {
  String? name;
  int? img1v1Id;
  int? id;
  String? picUrl;
  String? briefDesc;
  int? musicSize;


  SingersDetails();
  factory SingersDetails.fromJson(Map<String, dynamic> srcJson) => _$SingersDetailsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SingersDetailsToJson(this);
}


