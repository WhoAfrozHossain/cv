import 'package:cv/core/widgets/app_snack_bar.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message);
}

class CacheFailure extends Failure {}

class UnImplement extends Failure {}

class NoInternetConnection extends Failure {
  NoInternetConnection() {
    AppSnackBar.showErrorMessage(message: "No internet connection.");
  }
}
