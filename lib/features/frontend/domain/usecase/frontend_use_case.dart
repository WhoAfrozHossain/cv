import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:cv/core/apphelper/appResponse/app_api_response.dart';
import 'package:cv/core/apphelper/appResponse/model/model.dart';
import 'package:cv/core/error/failures.dart';
import 'package:cv/core/usecase/use_case.dart';

import '../repository/frontend_repository.dart';

class FrontendUseCase extends UseCase<AppApiResponse, Prams> {
  final FrontendRepository frontendRepository;

  FrontendUseCase({required this.frontendRepository});

  @override
  Future<Either<Failure, AppApiResponse<Model>>> call(params) {
    if (params is FrontendDataPrams) {
      return frontendRepository.getFrontendData();
    } else if (params is PostContactPrams) {
      return frontendRepository.postContact(body: params.body);
    } else {
      return frontendRepository.getFrontendData();
    }
  }
}

class Prams extends Equatable {
  Prams();

  @override
  List<Object?> get props => [];
}

class FrontendDataPrams extends Prams {

  FrontendDataPrams();

  @override
  List<Object?> get props => [];
}

class PostContactPrams extends Prams {
  final Map<String, String>? body;

  PostContactPrams({required this.body});

  @override
  List<Object?> get props => [];
}
