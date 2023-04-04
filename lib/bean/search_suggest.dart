import 'package:dora_music/bean/search_suggest_list.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_suggest.g.dart';

@JsonSerializable()
class SearchSuggest {
  List<SearchSuggestList>? allMatch;

  SearchSuggest();
  factory SearchSuggest.fromJson(Map<String, dynamic> srcJson, Function(dynamic json) param1) => _$SearchSuggestFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchSuggestToJson(this);
}


