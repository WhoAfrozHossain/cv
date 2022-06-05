import 'package:flutter/material.dart';
import 'package:cv/core/utils/utils_export.dart';

TextStyle _getTextStyle(
    double? fontSize, String fontFamily, FontWeight fontWeight, Color? color) {
  return TextStyle(
      fontSize: fontSize ?? FontSize.s14,
      fontFamily: fontFamily,
      color: color ?? ColorManager.grey,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle({double? fontSize, Color? color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,
      FontWeightManager.regular, color);
}
// light text style

TextStyle getLightStyle({double? fontSize, Color? color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,
      FontWeightManager.light, color);
}
// bold text style

TextStyle getBoldStyle({double? fontSize, Color? color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,
      FontWeightManager.bold, color);
}

// semi bold text style

TextStyle getSemiBoldStyle({double? fontSize, Color? color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,
      FontWeightManager.semiBold, color ?? ColorManager.lightGrey);
}

// medium text style

TextStyle getMediumStyle({double? fontSize, Color? color}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,
      FontWeightManager.medium, color);
}
