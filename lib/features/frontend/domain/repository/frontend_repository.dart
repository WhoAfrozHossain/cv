import 'package:dartz/dartz.dart';
import 'package:cv/core/apphelper/appResponse/app_api_response.dart';

import '../../../../core/error/failures.dart';

abstract class FrontendRepository {
  Future<Either<Failure, AppApiResponse>> getFrontendData();

  Future<Either<Failure, AppApiResponse>> postContact({Map<String, String>? body});
}
