import 'package:json_annotation/json_annotation.dart';
part 'hot_search.g.dart';

@JsonSerializable()
class HotSearch {
  String? content;
  String? iconUrl;
  String? searchWord;
  HotSearch();
  factory HotSearch.fromJson(Map<String, dynamic> srcJson) => _$HotSearchFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HotSearchToJson(this);
}


