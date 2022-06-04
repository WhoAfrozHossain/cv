import 'package:dartz/dartz.dart';
import 'package:cv/core/apphelper/appResponse/app_api_response.dart';
import 'package:cv/core/apphelper/appResponse/model/model.dart';
import 'package:cv/core/error/failures.dart';
import 'package:cv/core/network/network_info.dart';

import '../../domain/repository/products_repository.dart';
import '../datasource/products_remote_data_source.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsRemoteDataSource productsRemoteDataSource;
  final AppNetworkInfo appNetworkInfo;

  ProductsRepositoryImpl(
      {required this.productsRemoteDataSource, required this.appNetworkInfo});

  @override
  Future<Either<Failure, AppApiResponse<Model>>> getProducts(
      {String? nextUrl, String? limit, String? offset, String? search}) async {
    if (await appNetworkInfo.isConnected) {
      return productsRemoteDataSource.getProducts(
        nextUrl: nextUrl,
        limit: limit,
        offset: offset,
        search: search,
      );
    } else {
      return Left(NoInternetConnection());
    }
  }

  @override
  Future<Either<Failure, AppApiResponse<Model>>> getProductItem(
      {String? slug}) async {
    if (await appNetworkInfo.isConnected) {
      return productsRemoteDataSource.getProductItem(slug: slug);
    } else {
      return Left(NoInternetConnection());
    }
  }
}
