import 'package:json_annotation/json_annotation.dart';
part 'search_dj.g.dart';

@JsonSerializable()
class SearchDj {
  SearchDj();
  factory SearchDj.fromJson(Map<String, dynamic> srcJson) => _$SearchDjFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchDjToJson(this);
}


