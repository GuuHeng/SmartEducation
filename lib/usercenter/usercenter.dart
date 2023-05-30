import 'package:json_annotation/json_annotation.dart';
import 'package:smart_education/util/database/database_manager.dart';

class UserCenter {
  static UserCenter _center;

  factory UserCenter() => _center()
  static UserCenter? _instance;

  UserCenter._() {

  }

  static UserCenter _center() {
    if (_instance == null) {
      _instance = UserCenter._();
    }
    return _instance;
  }
  LoginUser user;

  // UserCenter(this.user);

  // factory UserCenter.fromJson(Map<String, dynamic> json) => _$UserCenterFromJson(json);

  // Map<String, dynamic> toJson() => _$UserCenterToJson(this);
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

  void createData() {}
}
