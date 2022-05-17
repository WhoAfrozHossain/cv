import 'package:cv/common/util/constants.dart';
import 'package:cv/common/util/utils.dart';
import 'package:cv/network/repository/repository_helper.dart';
import 'package:flutter/widgets.dart';

class FrontEndRepository {
  BuildContext context;

  FrontEndRepository({required this.context});

  Future<ResponseObject> getAllData() async {
    return RepositoryHelper(context).apiCall(url: Constants.getAllData);
  }

  Future<ResponseObject> postContact(Map<String, String> fields) async {
    return RepositoryHelper(context)
        .apiCall(method: "POST", url: Constants.postContact, fields: fields);
  }
}
