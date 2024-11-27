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
  static const primaryColors = Color(0xFF8B0000);
  static const backgroundColor = Color(0xffffffff);
  static const borderColor = Color(0xfff5f5f5);

  // Additional Colors
  static const secondary = Colors.black;

  static const ashWhite = Color(0xFFF5F5F5); // Light grayish white
  static const red = Color.fromRGBO(142, 42, 42, 1); // Bright red

  // Grey Shades
  static const lightGrey = Color(0xFFD3D3D3); // Light Grey
  static const mediumGrey = Color(0xFFB0B0B0); // Medium Grey
  static const darkGrey = Color(0xFF808080); // Dark Grey
  static const slateGrey = Color(0xFF708090); // Slate Grey
  static const dimGrey = Color(0xFF696969); // Dim Grey
  static const charcoalGrey = Color(0xFF36454F); // Charcoal Grey

  // Dark Red Shades
  static const darkRed = Color(0xFF8B0000); // Dark Red
  static const crimson = Color(0xFFDC143C); // Crimson Red
  static const fireBrick = Color(0xFFB22222); // Firebrick Red
  static const maroon = Color(0xFF800000); // Maroon Red
  static const burgundy = Color(0xFF7C0A02); // Burgundy Red
  static const oxblood = Color(0xFF4A0000); // Deep Oxblood Red
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
