import 'package:dartz/dartz.dart';
import 'package:cv/core/apphelper/appResponse/app_api_response.dart';

import '../../../../core/error/failures.dart';

abstract class ProductsRepository {
  Future<Either<Failure, AppApiResponse>> getProducts(
      {String? nextUrl, String? limit, String? offset, String? search});

  Future<Either<Failure, AppApiResponse>> getProductItem({String? slug});
}
