import 'package:flutter/material.dart';
import 'pages/root/splash.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

final global_key_navigator = new GlobalKey<NavigatorState>();

void main() {
  runApp(MaterialApp(
    home: Splash(),
    navigatorKey: global_key_navigator,
    builder: EasyLoading.init(),
    debugShowCheckedModeBanner: false,
  ));
}
