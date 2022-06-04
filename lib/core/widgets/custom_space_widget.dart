import 'package:flutter/material.dart';

extension CustomSpaceWidget on Widget {
  static SizedBox fromHeight(double height) {
    return SizedBox(height: height);
  }

  static SizedBox fromWidth(double width) {
    return SizedBox(width: width);
  }
}
