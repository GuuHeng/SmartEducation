import 'package:json_annotation/json_annotation.dart';

part 'usercenter.g.dart';

@JsonSerializable()
class UserCenter {
  LoginUser user;

  UserCenter(this.user);

  factory UserCenter.fromJson(Map<String, dynamic> json) => _$UserCenterFromJson(json);

  Map<String, dynamic> toJson() => _$UserCenterToJson(this);
}

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
  noknown,
  headTeacher,
  teacher,
  parent,
}
