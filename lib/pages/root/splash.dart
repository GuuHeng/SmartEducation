import 'package:flutter/material.dart';
import 'package:smart_education/usercenter/LoginUser.dart';
import 'package:smart_education/util/SharedPreferencesUtil.dart';
import 'package:smart_education/pages/root/smart_education.dart';
import 'package:smart_education/usercenter/usercenter.dart';
import 'package:smart_education/util/device.dart';
import 'package:smart_education/pages/login_page.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashState();
  }
}

class SplashState extends State<StatefulWidget> {
  final smartEducation = SmartEducation();
  bool splashHidden = false;
  @override
  void initState() {
    super.initState();
    UserCenter center = UserCenter();

    SharedPreferencesUtil.getInstance().then((value) {
      Map<String, dynamic>? user = value.getMap('loginuser');
      String? token = value.getString('token');

      center.token = token;

      if (user != null) {
        center.user = LoginUser.fromJson(user);
      }

      if (center.isLogin == true) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SmartEducation()));
      }
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        splashHidden = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(color: Colors.white),
      child: Align(
        child: Text(
          '智慧教育',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        alignment: Alignment.bottomCenter,
      ),
      width: Screen.width,
      height: Screen.height,
    );
  }
}
