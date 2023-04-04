import 'package:json_annotation/json_annotation.dart';
part 'users.g.dart';

@JsonSerializable()
class Users {
  int? userId;
  String? userName;
  Users();
  factory Users.fromJson(Map<String, dynamic> srcJson) => _$UsersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}


