import 'package:smart_education/util/database/database_manager.dart';
import 'package:smart_education/util/SharedPreferencesUtil.dart';
import 'LoginUser.dart';

class UserCenter {
  static UserCenter _center = UserCenter._internal();
  factory UserCenter() => _center;

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
  Future login(String username, String password) async {
    Future.delayed(Duration(seconds: 3), () {
      // 初始化登录用户信息
      const userMap = {
        'userId': '123456',
        'name': '胡歌',
        'mobile': '110',
        'idNumber': '320000202301011212'
      };

      user = LoginUser.fromJson(userMap);

      SharedPreferencesUtil.getInstance().then((value) {
        value.setMap('loginUser', userMap);
      });
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
