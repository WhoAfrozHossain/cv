import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:cv/core/apphelper/appResponse/model/model.dart';
import 'package:cv/core/error/failures.dart';

import '../../../../core/appRemoteHelper/app_remote_helper.dart';
import '../../../../core/apphelper/appResponse/app_api_response.dart';

abstract class FrontendRemoteDataSource {
  Future<Either<Failure, AppApiResponse>> getFrontendData();

  Future<Either<Failure, AppApiResponse>> postContact(
      {Map<String, String>? body});
}

class FrontendRemoteDataSourceImpl extends FrontendRemoteDataSource {
  @override
  Future<Either<Failure, AppApiResponse<Model>>> getFrontendData() async {
    http.Response _response = await http.get(
      Uri.parse(AppRemoteHelper.appUrls.frontendData),
      headers: AppRemoteHelper.header(),
    );

    AppApiResponse _appApiResponse = AppApiResponse.data(
      response: _response,
    );

    return Right(_appApiResponse);
  }

  @override
  Future<Either<Failure, AppApiResponse<Model>>> postContact(
      {Map<String, String>? body}) async {
    http.Response _response = await http.post(
      Uri.parse(AppRemoteHelper.appUrls.storeContact),
      headers: AppRemoteHelper.header(),
    );

    AppApiResponse _appApiResponse = AppApiResponse.data(
      response: _response,
    );

    return Right(_appApiResponse);
  }
}
