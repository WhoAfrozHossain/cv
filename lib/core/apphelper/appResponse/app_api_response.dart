import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cv/core/widgets/app_snack_bar.dart';

import 'model/model.dart';

part 'app_http_code.dart';

class AppApiResponse<T extends Model> {
  String? message;
  bool? success;
  T? data;
  String? body;
  int? statusCode;
  bool? isRemote;

  AppApiResponse(
      {this.data,
      this.success,
      this.message,
      this.body,
      this.statusCode,
      this.isRemote = true});

  factory AppApiResponse.data({
    T? model,
    required http.Response response,
  }) {
    return AppApiResponse(
      statusCode: response.statusCode,
      data: model,
      success: _isSuccess(response.statusCode),
      message: _handleMessage(response.statusCode, response.body),
      body: utf8.decode(response.bodyBytes),
    );
  }
}

String? _handleMessage(int statusCode, String body) {
  String? message;

  switch (statusCode) {
    case AppHttpCode.OK:
      message = jsonDecode(body)["message"] ?? "Success";
      break;

    case AppHttpCode.INTERNAL_SERVER_ERROR:
      message = "Internal Server error";

      AppSnackBar.showErrorMessage(
          message: jsonDecode(body)["errors"].toString());
      break;

    case AppHttpCode.ACCEPTED:
      message = jsonDecode(body)["message"] ?? "Accepted";
      break;
    case AppHttpCode.CREATED:
      message = jsonDecode(body)["message"] ?? "Created";
      break;

    case AppHttpCode.FORBIDDEN:
      message = jsonDecode(body)["message"] ?? "Forbidden";
      break;
    case AppHttpCode.NOT_FOUND:
      message = jsonDecode(body)["message"] ?? "Not Found";
      break;
    case AppHttpCode.UNAUTHORIZED:
      message = jsonDecode(body)["message"] ?? "Unauthorized";

      AppSnackBar.showErrorMessage(message: "Unauthorized");

      break;
    case AppHttpCode.UNPROCESSABLE_ENTITY:
      message = jsonDecode(body)["message"] ?? "Unprocessable Entity";

      Map<String, dynamic> data = jsonDecode(body)["errors"];

      String errorMessage = "";

      for (var element in data.values) {
        String error =
            element.toString().replaceAll("[", "").replaceAll("]", "");
        if (errorMessage.isEmpty) {
          errorMessage = error;
        } else {
          errorMessage = "$errorMessage\n$error";
        }
      }

      AppSnackBar.showErrorMessage(
        message: errorMessage,
      );

      break;

    case AppHttpCode.TIME_OUT:
      message = "Time out";
      AppSnackBar.showErrorMessage(message: "Time out.");

      break;
  }

  return message ?? "";
}

bool _isSuccess(int statusCode) {
  if (statusCode == 200 || statusCode == 201) {
    return true;
  } else {
    return false;
  }
}
