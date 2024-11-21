import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomSizes {
  static const double padding = 12.0;
  static const double smallPadding = 7.0;
  static const double largePadding = 17.5;
  static const double cardBorderRadius = 8.0;
  static const double iconSize = 27.0;
  static const double headingTextSize = 20.0;
  static const double cardTextSize = 12.0;
  static const double appBarTextSize = 16.0;
}

class CustomColors {
  static const appBarTextColor = Color(0xffffffff);
  static const headingTextColor = Colors.black;
  static const salesColor = Color(0xFF4CAF50);
  static const primaryColors = Color(0xff3b69b7);
  static const backgroundColor = Color(0xffffffff);
  static const borderColor = Color(0xfff5f5f5);
}

void xmToast(String message, Color backgroundColor) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: backgroundColor,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}

void printx(String format, dynamic argument) {
  if (kDebugMode) {
    print('$format $argument');
  }
}
