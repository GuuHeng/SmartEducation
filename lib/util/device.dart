import 'dart:ui';

import 'package:flutter/material.dart';

class Screen {
  static final width = window.physicalSize.width/window.devicePixelRatio;
  static final height = window.physicalSize.height/window.devicePixelRatio;
  static final statusBar_height = window.padding.top/window.devicePixelRatio;
}