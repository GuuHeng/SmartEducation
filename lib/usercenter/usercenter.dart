import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_education/util/database/database_manager.dart';
import 'LoginUser.dart';

class UserCenter {
  static UserCenter _center = UserCenter._internal();
  factory UserCenter() => _center;
  static UserCenter? _instance;

  UserCenter._internal() {}

  // 登录用户
  LoginUser? user;

  String? token;

  // 是否登录
  get isLogin {
    return user != null && token != null && token!.isNotEmpty == true;
  }
}

extension UserCenterManager on UserCenter {
  // 模仿登录
  Future login() async {
    Future.delayed(Duration(seconds: 3), () {
      // 初始化登录用户信息
      user = LoginUser('123456', '胡老师', '110', '320000202301011212');
    }).then((value) => {
          // 开启数据库
          DatabaseManager().open(user!.userId)
        });
  }

  logout() {
    token = null;
    user = null;
  }
}
