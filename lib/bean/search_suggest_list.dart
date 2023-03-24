import 'package:json_annotation/json_annotation.dart';
part 'search_suggest_list.g.dart';

@JsonSerializable()
class SearchSuggestList {
  String? keyword;
  int? type;
  SearchSuggestList();
  factory SearchSuggestList.fromJson(Map<String, dynamic> srcJson) => _$SearchSuggestListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchSuggestListToJson(this);
}


