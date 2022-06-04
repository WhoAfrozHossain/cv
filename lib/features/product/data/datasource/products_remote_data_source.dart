import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:cv/core/apphelper/appResponse/model/model.dart';
import 'package:cv/core/error/failures.dart';

import '../../../../core/appRemoteHelper/app_remote_helper.dart';
import '../../../../core/apphelper/appResponse/app_api_response.dart';

abstract class ProductsRemoteDataSource {
  Future<Either<Failure, AppApiResponse>> getProducts(
      {String? nextUrl, String? limit, String? offset, String? search});

  Future<Either<Failure, AppApiResponse>> getProductItem({String? slug});
}

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  @override
  Future<Either<Failure, AppApiResponse<Model>>> getProducts(
      {String? nextUrl, String? limit, String? offset, String? search}) async {
    http.Response _response = await http.get(
      Uri.parse(nextUrl ??
          "${AppRemoteHelper.appUrls.frontendData}limit=${limit ?? 20}${offset != null ? "&offset=$offset" : ""}${search != null ? "&search=$search" : ""}"),
      headers: AppRemoteHelper.header(),
    );

    AppApiResponse _appApiResponse = AppApiResponse.data(
      response: _response,
    );

    return Right(_appApiResponse);
  }

  @override
  Future<Either<Failure, AppApiResponse<Model>>> getProductItem(
      {String? slug}) async {
    http.Response _response = await http.get(
      Uri.parse("${AppRemoteHelper.appUrls.storeContact}$slug"),
      headers: AppRemoteHelper.header(),
    );

    AppApiResponse _appApiResponse = AppApiResponse.data(
      response: _response,
    );

    return Right(_appApiResponse);
  }
}
