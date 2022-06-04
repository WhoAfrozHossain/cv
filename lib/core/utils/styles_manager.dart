import 'package:flutter/material.dart';
import 'package:cv/core/utils/utils_export.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle({double? fontSize, Color? color}) {
  return _getTextStyle(fontSize ?? FontSize.s12, FontConstants.fontFamily,
      FontWeightManager.regular, color ?? ColorManager.lightGrey);
}
// light text style

TextStyle getLightStyle({double? fontSize, Color? color}) {
  return _getTextStyle(fontSize ?? FontSize.s12, FontConstants.fontFamily,
      FontWeightManager.light, color ?? ColorManager.lightGrey);
}
// bold text style

TextStyle getBoldStyle({double? fontSize, Color? color}) {
  return _getTextStyle(fontSize ?? FontSize.s12, FontConstants.fontFamily,
      FontWeightManager.bold, color ?? ColorManager.lightGrey);
}

// semi bold text style

TextStyle getSemiBoldStyle({double? fontSize, Color? color}) {
  return _getTextStyle(fontSize ?? FontSize.s12, FontConstants.fontFamily,
      FontWeightManager.semiBold, color ?? ColorManager.lightGrey);
}

// medium text style

TextStyle getMediumStyle({double? fontSize, Color? color}) {
  return _getTextStyle(fontSize ?? FontSize.s12, FontConstants.fontFamily,
      FontWeightManager.medium, color ?? ColorManager.lightGrey);
}
