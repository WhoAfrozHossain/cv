// ignore_for_file: constant_identifier_names

import 'package:cv/common/dialog/overlay_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

int loadingCount = 0;

class Utils {
  const Utils._();

  static void loadingDialog(BuildContext context) {
    if (loadingCount < 0) {
      loadingCount = 0;
    }
    loadingCount++;

    if (loadingCount == 1) {
      Navigator.of(context).push(
        OverlayDialog(
          dialogWidget: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(20),
              child: const CircularProgressIndicator(
                color: Color(0xff5A72EA),
              ),
            ),
          ),
          dialogBarrierLabel: 'loadingDialog',
        ),
      );
    }
  }

  static void closeDialog(BuildContext context) {
    loadingCount--;

    if (loadingCount == 0 && Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}

// show error message using toast
showErrorToast(String message) {
  if (message != "") {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      webShowClose: true,
      webBgColor: "linear-gradient(to right, #B71C1C, #B71C1C)",
      fontSize: 16.0,
    );
  }

  // debugPrint("Error:: $message");
}

// show success message using toast
showSuccessToast(String message) {
  if (message != "") {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      webShowClose: true,
      // webBgColor: "linear-gradient(to right, #388E36, #388E36)",
      fontSize: 16.0,
    );
  }

  // debugPrint("Success:: $message");
}

// checkInternet(Function() requestDidSaved) async {
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.none) {
//     Get.toNamed('/no_internet').then((value) {
//       checkInternet(requestDidSaved);
//     });
//   } else {
//     requestDidSaved();
//   }
// }

class ResponseObject {
  int id;
  Object object;

  ResponseObject(
      {this.id = ResponseCode.NO_INTERNET_CONNECTION, required this.object});
}

class APIResponseCode {
  static const int OK = 200;
  static const int CREATED = 201;
  static const int BAD_REQUEST = 400;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int UNAUTHORIZED_ERROR = 401;
}

class ResponseCode {
  static const int NO_INTERNET_CONNECTION = 0;
  static const int AUTHORIZATION_FAILED = 401;
  static const int SUCCESSFUL = 500;
  static const int FAILED = 501;
  static const int NOT_FOUND = 502;
}