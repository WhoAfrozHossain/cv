import 'package:flutter/material.dart';

class ColorManager {
  static Color primaryColor = HexColor.fromHex("#5A72EA");
  static Color primaryColorDark = HexColor.fromHex("#3048bf");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#646464");
  static Color lightGrey = HexColor.fromHex("#989898");
  static Color primaryOpacity70 = primaryColor.withOpacity(.7);
  static Color backgroundColor = HexColor.fromHex("#F7F2FF");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black = HexColor.fromHex("#323232");

  // Extra Color
  static Color secondaryColor = HexColor.fromHex("#FF5A59");
  static Color secondaryLightColor = secondaryColor.withOpacity(.7);

  LinearGradient gradientButtonColor() {
    return LinearGradient(
        colors: [primaryColor, primaryColorDark],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp);
  }
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
