import 'package:cv/core/apphelper/app_helper.dart';
import 'package:cv/core/utils/color_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppSnackBar {
  static _showMessage(
      String message, Color backgroundColor, int duration, String? webBgColor) {
    if (kIsWeb) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: duration,
        backgroundColor: backgroundColor,
        textColor: ColorManager.white,
        webShowClose: true,
        webBgColor: webBgColor,
        fontSize: 16.0,
      );
    } else {
      AppHelper.snackBarKey.currentState!.showSnackBar(SnackBar(
        duration: Duration(seconds: duration),
        backgroundColor: backgroundColor,
        content: Text(
          message,
          style: TextStyle(color: ColorManager.white),
        ),
        dismissDirection: DismissDirection.endToStart,
      ));
    }
  }

  static showErrorMessage({String? message}) {
    if (message != null && message.isNotEmpty) {
      _showMessage(message, ColorManager.error, 3,
          "linear-gradient(to right, #B71C1C, #B71C1C)");
    }
  }

  static showSuccessMessage({String? message}) {
    if (message != null && message.isNotEmpty) {
      _showMessage(message, ColorManager.primaryOpacity70, 2, null);
    }
  }
}
