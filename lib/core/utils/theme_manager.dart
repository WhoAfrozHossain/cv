// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:cv/core/utils/utils_export.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primaryColor,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.primaryColorDark,
    secondaryHeaderColor: ColorManager.secondaryColor,
    disabledColor: ColorManager.darkGrey,
    splashColor: ColorManager.primaryOpacity70,
    accentColor: ColorManager.grey,
    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    // App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primaryColor,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
      brightness: Brightness.dark,
    ),
    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.darkGrey,
      buttonColor: ColorManager.primaryColor,
      splashColor: ColorManager.primaryOpacity70,
    ),

    textButtonTheme: TextButtonThemeData(),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        primary: ColorManager.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    // Text theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s16,
      ),
      headline2: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
      headline3: getBoldStyle(
        color: ColorManager.primaryColor,
        fontSize: FontSize.s16,
      ),
      headline4: getRegularStyle(
        color: ColorManager.primaryColor,
        fontSize: FontSize.s14,
      ),
      subtitle1: getMediumStyle(
        color: ColorManager.lightGrey,
        fontSize: FontSize.s14,
      ),
      subtitle2: getMediumStyle(
        color: ColorManager.primaryColor,
        fontSize: FontSize.s14,
      ),
      bodyText2: getMediumStyle(
        color: ColorManager.lightGrey,
      ),
      caption: getRegularStyle(
        color: ColorManager.darkGrey,
      ),
      bodyText1: getRegularStyle(
        color: ColorManager.grey,
      ),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p24,
        vertical: AppPadding.p12,
      ),
      // hint style
      hintStyle: getRegularStyle(color: ColorManager.lightGrey),

      // label style
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),

      // error style
      errorStyle: getRegularStyle(color: ColorManager.error),

      // suffix icon color
      suffixIconColor: ColorManager.lightGrey,

      // enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.backgroundColor,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s16),
        ),
      ),

      // focused border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.backgroundColor,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s16),
        ),
      ),

      // error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),

      // focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),
  );
}
