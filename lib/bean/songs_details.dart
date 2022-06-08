import 'package:json_annotation/json_annotation.dart';
part 'songs_details.g.dart';

@JsonSerializable()
class SongsDetails {
  String ? name;
  String ? picUrl;
  int ? id;



  SongsDetails();
  factory SongsDetails.fromJson(Map<String, dynamic> srcJson) => _$SongsDetailsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SongsDetailsToJson(this);
}


