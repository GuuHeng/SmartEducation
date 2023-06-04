import 'package:flutter/material.dart';
import 'package:smart_education/usercenter/usercenter.dart';
import 'package:smart_education/pages/root/smart_education.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: '用户名', icon: Icon(Icons.account_circle)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入用户名';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: '密码', icon: Icon(Icons.lock)),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入密码';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              SizedBox(
                child: ElevatedButton(
                  child: Text(
                    '登 录',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                      UserCenter()
                          .login(_usernameController.text, _passwordController.text)
                          .then((value) {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => SmartEducation()));
                      });
                    }
                  },
                ),
                height: 50,
              ),
              if (_errorMessage != null)
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
