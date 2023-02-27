import 'dart:ui';

import 'package:flutter/material.dart';

class Screen {
  // 屏幕宽度
  static final width = window.physicalSize.width/window.devicePixelRatio;
  // 屏幕高度
  static final height = window.physicalSize.height/window.devicePixelRatio;
  // 状态栏高度
  static final statusBar_height = window.padding.top/window.devicePixelRatio;
  // 导航栏高度（含状态栏）
  static final navigatorBar_height = window.padding.top/window.devicePixelRatio + 44;
}