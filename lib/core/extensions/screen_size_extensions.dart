import 'package:flutter/material.dart';

extension ScreenSizeExtensions on BuildContext {
  double screenHeight() => MediaQuery.sizeOf(this).height;

  double screenWidth() => MediaQuery.sizeOf(this).width;
}
