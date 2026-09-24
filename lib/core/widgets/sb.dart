import 'package:flutter/material.dart';

class SB {
  SB._();

  static Widget h(double height) => SizedBox(height: height);
  static Widget w(double width) => SizedBox(width: width);
  static Widget hw(double height, double width) =>
      SizedBox(height: height, width: width);
}
