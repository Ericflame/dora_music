import 'package:json_annotation/json_annotation.dart';

import 'creator.dart';
part 'search_play_lists.g.dart';

@JsonSerializable()
class SearchPlayLists {
  int? id;
  String? name;
  Creator? creator;
  int? trackCount;
  int? playCount;
  SearchPlayLists();
  factory SearchPlayLists.fromJson(Map<String, dynamic> srcJson) => _$SearchPlayListsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchPlayListsToJson(this);
}


