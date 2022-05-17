import 'dart:convert';

import 'package:cv/common/util/utils.dart';
import 'package:cv/network/models/all_data_model.dart';
import 'package:cv/network/repository/frontend_repository.dart';
import 'package:flutter/widgets.dart';

class NetworkController {
  BuildContext context;

  NetworkController({required this.context});

  AllDataModel? allData;

  Future<AllDataModel?> getAllData() async {
    final response = await FrontEndRepository(context: context).getAllData();
    if (response.id == ResponseCode.SUCCESSFUL) {
      allData = AllDataModel.fromJson(json.decode(response.object.toString()));
    } else {
      showErrorToast(response.object.toString());
    }
    return allData;
  }

  void postContact(String name, String email, String subject, String message,) async {
    Map<String, String> body = {
      'name': name,
      'email': email,
      'subject': subject,
      'message': message
    };

    final response = await FrontEndRepository(context: context).postContact(body);
    if (response.id == ResponseCode.SUCCESSFUL) {
      // allData = AllDataModel.fromJson(json.decode(response.object.toString()));
      // showErrorToast(response.object.toString());
    } else {
      showErrorToast(response.object.toString());
    }
  }
}