import 'package:json_annotation/json_annotation.dart';

part 'LoginUser.g.dart';

@JsonSerializable()
class LoginUser {
  final String userId;
  String name;
  String mobile;
  String idNumber;
  String? portrait;
  // 身份立场，如班主任，家长
  UserPosition position = UserPosition.noknown;

  LoginUser(this.userId, this.name, this.mobile, this.idNumber, {this.portrait});

  factory LoginUser.fromJson(Map<String, dynamic> json) => _$LoginUserFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserToJson(this);
}

enum UserPosition {
  noknown, // 未知角色
  headTeacher, // 班主任
  teacher, // 任课老师
  parent, // 学生家长
}
