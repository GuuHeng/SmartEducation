import 'package:json_annotation/json_annotation.dart';
import 'package:smart_education/util/database/database_manager.dart';

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

extension UserCenterManager on UserCenter {
  // 模仿登录
  Future login() async {

    // 初始化登录用户信息
    LoginUser user = await LoginUser('123456', '胡老师', '110', '320000202301011212');
    this.user = user;

    // 开启数据库
    DatabaseManager().open(user.userId);
  }

  void createData() {
    
  }
}
