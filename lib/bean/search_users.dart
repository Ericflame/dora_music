import 'package:json_annotation/json_annotation.dart';
part 'search_users.g.dart';

@JsonSerializable()
class SearchUsers {
  String? nickname;
  String? url;
  String? signature;

  SearchUsers();
  factory SearchUsers.fromJson(Map<String, dynamic> srcJson) => _$SearchUsersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchUsersToJson(this);
}


