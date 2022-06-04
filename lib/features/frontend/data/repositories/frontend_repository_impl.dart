import 'package:dartz/dartz.dart';
import 'package:cv/core/apphelper/appResponse/app_api_response.dart';
import 'package:cv/core/apphelper/appResponse/model/model.dart';
import 'package:cv/core/error/failures.dart';
import 'package:cv/core/network/network_info.dart';

import '../../domain/repository/frontend_repository.dart';
import '../datasource/frontend_remote_data_source.dart';

class FrontendRepositoryImpl extends FrontendRepository {
  final FrontendRemoteDataSource frontendRemoteDataSource;
  final AppNetworkInfo appNetworkInfo;

  FrontendRepositoryImpl(
      {required this.frontendRemoteDataSource, required this.appNetworkInfo});

  @override
  Future<Either<Failure, AppApiResponse<Model>>> getFrontendData() async {
    if (await appNetworkInfo.isConnected) {
      return frontendRemoteDataSource.getFrontendData();
    } else {
      return Left(NoInternetConnection());
    }
  }

  @override
  Future<Either<Failure, AppApiResponse<Model>>> postContact(
      {Map<String, String>? body}) async {
    if (await appNetworkInfo.isConnected) {
      return frontendRemoteDataSource.postContact(body: body);
    } else {
      return Left(NoInternetConnection());
    }
  }
}
