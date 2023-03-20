import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            cursorColor: Colors.blue,
            cursorWidth: 1.0,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              labelText: '手机号',
              hintText: '输入手机号',
              errorText: '请输入11位有效手机号',
              focusColor: Colors.blue,
            ),
          ),
          TextField(
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            cursorColor: Colors.blue,
            cursorWidth: 1.0,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              labelText: '密码',
              hintText: '输入密码',
              errorText: '请输入8~20位密码',
              focusColor: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
